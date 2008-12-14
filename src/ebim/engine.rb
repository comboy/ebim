
module Ebim

  class Engine

    def initialize(base)
      @base = base
    end

    def connect
        #org.jivesoftware.smack.XMPPConnection.DEBUG_ENABLED = true;
        puts "weeeeeeeeeeee"
        config = org.jivesoftware.smack.ConnectionConfiguration.new("jabster.pl", 5222,'jabster.pl');
        config.setSASLAuthenticationEnabled(true);

        conn1 = org.jivesoftware.smack.XMPPConnection.new(config);
        puts "connect"
        conn1.connect
        org.jivesoftware.smack.SASLAuthentication.supportSASLMechanism("PLAIN", 0);
        puts "login"

        conn1.login('kompotek','bociankowo','eou')
        roster = conn1.roster

        puts roster.entries

        items = []
        roster.entries.each do |entry|
          contact = Base::Contact.new entry.user, entry.name, :groups => entry.groups.map{|g| g.name}
          items << contact
        end
        @base.roster_items = items

        @chat = conn1.chat_manager.add_chat_listener MyChatListener.new

    end

  class MyChatListener
    include org.jivesoftware.smack.ChatManagerListener
    def chat_created(chat,locally)
      chat.send_message "watta"
      puts chat
    end
  end

  # Implements MessageListener to print message body to STDOUT
  class StdoutMessageListener
    include org.jivesoftware.smack.MessageListener

    def processMessage(chat, message)
      puts "#{chat.participant}: #{message.body}" if !message.body.empty?
    end
  end


  

  end

end
