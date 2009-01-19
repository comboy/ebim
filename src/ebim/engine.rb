
module Ebim

  class Engine

    attr_accessor :base

    def initialize(base)
      @base = base
    end

    def connect
      #org.jivesoftware.smack.XMPPConnection.DEBUG_ENABLED = true;
      config = org.jivesoftware.smack.ConnectionConfiguration.new("jabster.pl", 5222,'jabster.pl');
      config.setSASLAuthenticationEnabled(true);

      @conn = conn1 = org.jivesoftware.smack.XMPPConnection.new(config);
      debug "connecting"
      conn1.connect
      org.jivesoftware.smack.SASLAuthentication.supportSASLMechanism("PLAIN", 0);

      debug "logging in"
      conn1.login('kompotek','bociankowo','ebim')
      @roster = roster = conn1.roster
      @roster.subscription_mode = org.jivesoftware.smack.Roster::SubscriptionMode.accept_all

      items = []
      roster.entries.each do |entry|
        contact = Base::Contact.new entry.user, entry.name, :groups => entry.groups.map{|g| g.name}
        items << contact
      end
      @base.roster_items = items

      @my_roster_listener = MyRosterListener.new self
      roster.add_roster_listener @my_roster_listener

      items.each do |item|
        presence = roster.get_presence(item.jid)
        debug "initial presence for #{item.jid} : #{presence}"
        @my_roster_listener.presence_changed roster.get_presence(item.jid)
      end

      @chat = conn1.chat_manager.add_chat_listener MyChatListener.new(@base)

      # Settinf self initial presence
      set_presence(:dnd,'wasaaabi')

    end

    def add_contact(jid,name)
      @roster.create_entry(jid,name,nil)
    end

    def send_message(jid,msg)
      puts "send message #{jid} #{msg}"
      #chat = @conn.chat_manager.create_chat jid, MyChatListener.new(@base)
      #chat.send_message msg
      mess = org.jivesoftware.smack.packet.Message.new(jid,org.jivesoftware.smack.packet.Message::Type.chat)
      mess.body = msg
      @conn.send_packet(mess)
    end

    def set_presence(presence,status=nil)
      packet = org.jivesoftware.smack.packet.Presence.new(org.jivesoftware.smack.packet.Presence::Type.available)
      # available by default
      # FIXME This is wrong - some validation or whatever
      packet.mode = org.jivesoftware.smack.packet.Presence::Mode.send(presence)
      packet.status = 'ebim test'
      @conn.send_packet(packet)
    end

    class MyRosterListener
      include org.jivesoftware.smack.RosterListener

      def initialize(engine)
        # puts "my roster listener"
        @base = engine.base
        debug "initializing my presence listener"
      end

      def presence_changed(presence)
        begin
          #debug "latafak"
          #debug "presence received #{presence}"                                                                                                                                                                                                                                                                                                                                                                                                                                                               }"
          #puts "PRESENCE"
          #puts "type = #{presence.type} (#{presence.mode}, status = #{presence.status}"
          #puts "from = #{presence.from} (#{presence.from.class})"
          #pp presence
          #puts "hmm"
          #puts "sraj"
          #debug "presence -- #{presence} - #{presence.mode}"

          pres = presence.mode.to_s
          if pres.strip.empty? and presence.available
            pres = 'available'
          end
          @base.item_presence_change(presence.from,pres,presence.status.to_s)
        rescue Exception => ex
          puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!! #{ex}"
          puts "##-------- #{ex.backtrace.join("\n")}"
        end
      end

      def debug(text)
        @base.debug "Presence: #{text}"
      end
    end

    class MyChatListener
      include org.jivesoftware.smack.ChatManagerListener

      def initialize(base)
        @base = base
      end

      def chat_created(chat,locally)
        chat.send_message "watta"
        chat.add_message_listener MyMessageListener.new(@base)
        puts "fok"
        puts chat
      end
    end
  

    # Implements MessageListener to print message body to STDOUT
    class MyMessageListener
      include org.jivesoftware.smack.MessageListener

      def initialize(base)
        @base = base
      end

      def processMessage(chat, message)
        puts "#{chat.participant}: #{message.body}" if !message.body.empty?
        @base.message_received chat.participant, message.body unless message.body.empty?
      end
    end


    def debug(text)
      base.debug("Engine: #{text}")
    end

  end

end
