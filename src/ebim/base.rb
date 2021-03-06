require 'logger'

module Ebim
  class Base

    @@instance = nil
    
    attr_accessor :roster
    attr_accessor :config

    def self.instance
      @@instance
    end

    def initialize
      @logger = ::Logger.new File.join(Ebim.conf_dir,"ebim.log")
      
      # yeah, maybe I'll implement singleton
      @@instance = self

      debug ""
      debug ""
      debug ""
      debug "stanting..."
      #@config = Config.new self
      @roster = Roster.new
      @engine = Engine.new self
      @config = Config.new self
      #@gui = Gui.new self
#      @gui.show_error "ueonth"
     # @account = Gui::Account.new self
      @gui = MainController.instance
      #Thread.new do
        @engine.connect
      #end
      #@gui.show
    end

    def update_roster_item(item)
      @gui.item_update item
    end

    def roster_items=(items)
      #puts "set roster itmes"
      #pp items
      @roster.contacts = items
      @gui.set_roster_items @roster.contacts
    end

    def message_received(jid,text)
      puts "base: message received"
      # XXX like this it's not possible for gui to tell which resorce sent it      
      @gui.message_received strip_jid(jid), text
    end

    def send_message(jid,text)
      @engine.send_message jid,text
    end

    def item_presence_change(jid,presence,status)
      puts "TTTTTTTTTTTt"
      #return
      debug("item presence change: #{jid} | #{presence} | #{status}")
      pure_jid, resource = jid.split('/')
      item = @roster[pure_jid]
      item.update_presence(resource,presence,status)
      puts "go gui"
      @gui.item_update item
#      @gui.temp_easy_update @roster.contacts
#      @gui.set_roster_items @roster.contacts
    end

    def set_presence(presence,status='')
      @engine.set_presence(presence,status)
    end

    def add_contact(jid,name)
      @engine.add_contact(jid,name)
    end

    def auth_failure
      @gui.show_error("Niepoprawne dane logowania do serwera jabbera")
      Gui::Account.new self, true
    end

    def connection_error
      @gui.connection_error
    end

    def connect
      @engine.connect
    end

    def homedir
      File.join(::Ebim::PATH,"tmp")
    end

    def debug(text)
      @logger.info text
    end

    protected

    def strip_jid(jid)
      jid.split('/')[0]
    end

  end
end
