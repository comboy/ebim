class AddContactController < ApplicationController
  set_model 'AddContactModel'
  set_view 'AddContactView'
  set_close_action :close

  def button_add_contact_action_performed
    puts "add a contact here"
    update_model(view_state.first,:jid)
    update_model(view_state.first,:name)
    Ebim::Base.instance.add_contact(model.jid,model.name)
    #MainController.instance.add_contact(model.jid, model.name)
    close
  end

end
