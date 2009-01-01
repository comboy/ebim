class ContactPartialController < ApplicationController
  set_model 'ContactPartialModel'
  set_view 'ContactPartialView'
  set_close_action :exit


  # PUBLIC API

  def selected=(selected)
    model.selected = selected
  end

  def set_contact(contact)
    model.contact = contact
    update_view
  end

  def get_java_window
    signal :get_java_window
    transfer[:java_window]
  end
  
end
