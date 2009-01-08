class MessageController < ApplicationController
  set_model 'MessageModel'
  set_view 'MessageView'
  set_close_action :close

  add_listener :type => :key, :components => ["talkEditorPane"]


  def talkEditorPane_key_pressed(ev)
    if ev.key_code == 10
      #@m,t = view_state
      update_model(view_state.first,:new_message)
      Ebim::Base.instance.send_message(model.contact.jid,model.new_message)
      add_message('ja',model.new_message)
      model.new_message = ''
      update_view
      #puts "------ #{view.talk_editor_pane.text}"
    end
  end

  def contact=(contact)
    model.contact = contact
    update_view
  end

  def add_message(author, text)
    model.talk += "<b>#{author}</b>: #{text}<br>"
    update_view
  end

end
