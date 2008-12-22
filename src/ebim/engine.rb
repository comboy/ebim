
module Ebim

  class Engine

    attr_accessor :base

    def initialize(base)
      @base = base
    end

    def connect
        #org.jivesoftware.smack.XMPPConnection.DEBUG_ENABLED = true;
        #puts "weeeeeeeeeeee"
        config = org.jivesoftware.smack.ConnectionConfiguration.new("jabster.pl", 5222,'jabster.pl');
        config.setSASLAuthenticationEnabled(true);

        conn1 = org.jivesoftware.smack.XMPPConnection.new(config);
        #puts "connect"
        debug "connecting"
        begin
          conn1.connect
        rescue org.jivesoftware.smack.XMPPException => ex
          #TODO FIXME connection error handling
          raise "TODO: handle me ! Could not connect to server"
          puts "EX!!! #{ex} :: #{ex.class}"
          return
        end
        org.jivesoftware.smack.SASLAuthentication.supportSASLMechanism("PLAIN", 0);
        #puts "login"

        debug "logging in"
        conn1.login('kompotek','bociankowo','eou')
        roster = conn1.roster

        #puts roster.entries

        items = []
        roster.entries.each do |entry|
          contact = Base::Contact.new entry.user, entry.name, :groups => entry.groups.map{|g| g.name}
          items << contact
        end
        @base.roster_items = items
#        items.each do |item|
#          presence = roster.get_presence(item.jid)
#          debug "presence #{presence}"
#          @base.item_presence_change(presence.from,presence.mode.to_s,presence.status.to_s)
##          presence_changed roster.get_presence(item.jid)
#        end

      roster.add_roster_listener MyRosterListener.new self

      @chat_manager = conn1.chat_manager
      @chat_manager.add_chat_listener MyChatListener.new(@base)




    end

    def send_message(jid,text)

    end

  class MyRosterListener
    include org.jivesoftware.smack.RosterListener

     def initialize(engine)
     # puts "my roster listener"
      @base = engine.base
    end

    def presence_changed(presence)
      begin
      debug "latafak"
      #debug "presence received #{presence}"                                                                                                                                                                                                                                                                                                                                                                                                                                                               }"
      puts "PRESENCE"
      #puts "type = #{presence.type} (#{presence.mode}, status = #{presence.status}"
      #puts "from = #{presence.from} (#{presence.from.class})"
      #pp presence
      #puts "hmm"
      #puts "sraj"
      debug "presence -- #{presence} - #{presence.mode}"

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
