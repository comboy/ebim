class MainController < ApplicationController
  set_model 'MainModel'
  set_view 'MainView'
  set_close_action :exit

  add_listener :type => :mouse, :components => [:contacts_tree]

  def initialize
    @message_windows = {}
    super
  end

  def contacts_tree_mouse_released(bla)    
    if bla.getClickCount == 2
      signal :get_row
      node = transfer[:row]
      if node.is_leaf
        #m = MessageController.create_instance.open
        #m.contact = node.user_object
        m = window_for node.user_object.jid
        m.add_message 'ja', 'wassup'
        m.add_message 'bla', 'nofin'
        m.add_message 'ja', 'soka'
      end
    end
  end

  def menu_add_contact_action_performed
    add_contact = AddContactController.create_instance.open
  end


  # Coming from outside

  def message_received(jid,text)
    puts "wwwwwwwwwwwwwweeeeeeee #{jid}, #{text}"
    w = window_for(jid)
    w.add_message(jid,text)
  end

  def set_roster_items(items)
    model.contacts = items
    update_view
  end

  def temp_easy_update items
    set_roster_items items
  end

  def load
    @message_windows = {}
  end

  def item_update(blah)
    puts "shold update some"
    begin
   #   signal :refresh_contacts
    rescue Exception => ex
      puts "EEEEEEEEEEEEX #{ex}"
    end
    update_view
  end

  # controller stuff

  def window_for(jid)
    @message_windows[jid] || (
      m =  MessageController.create_instance.open
      m.contact = model.contact_for_jid jid
      @message_windows[jid] = m
    )
  end

end
