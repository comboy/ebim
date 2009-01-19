include_class "javax.swing.ImageIcon"


class MainController < ApplicationController
  set_model 'MainModel'
  set_view 'MainView'
  set_close_action :exit

  add_listener :type => :mouse, :components => [:contacts_tree]

  def initialize
    @message_windows = {}
    super
  end

  def show_error(msg,title='Wystąpił błąd')
    transfer[:msg] = msg
    signal :show_error
  end


  def combo_box_presence_action_performed
    puts "Coś się wybrało..."
    #update_model(view_state.model, :presence_selected_item)
    signal :get_presence
    puts "got #{transfer[:presence]}"
    Ebim::Base.instance.set_presence(transfer[:presence])
  end

  def contacts_tree_mouse_released(bla)    
    if bla.getClickCount == 2
      signal :get_row
      node = transfer[:row]
      if node.is_leaf
        #m = MessageController.create_instance.open
        #m.contact = node.user_object
        m = window_for node.user_object.jid
      end
    end
  end

  def menu_add_contact_action_performed
    add_contact = AddContactController.instance
    add_contact.open
  end

  def menu_preferences_action_performed
    preferences = PreferencesController.instance
    preferences.open
  end

  def menu_exit_action_performed
    close
  end

  def add_contact(jid,name)
    puts "should now add contact #{jid} with name #{name}"
  end


  # Coming from outside

  def message_received(jid,text)
    puts "msg received #{jid}, #{text}"
    w = window_for(jid)
    w.add_message(jid,text)
  end

  def set_roster_items(items)
    model.contacts = items
    update_view
    signal :expand_all
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
