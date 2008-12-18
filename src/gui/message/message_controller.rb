class MessageController < ApplicationController
  set_model 'MessageModel'
  set_view 'MessageView'
  set_close_action :exit


  def contact=(contact)
    model.contact = contact
    update_view
  end

  def add_message(auhtor, text)
    model.talk += "<b>author</b>: #{text}<br>"
    update_view
  end
  
end
