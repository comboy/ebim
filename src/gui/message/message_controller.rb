class MessageController < ApplicationController
  set_model 'MessageModel'
  set_view 'MessageView'
  set_close_action :exit

  add_listener :type => :key, :components => ["talkEditorPane"]


  def talkEditorPane_key_pressed(ev)
    if ev.key_code == 10
      m,t = view_state
      add_message('ja',m.new_message)
      #model.new_message = ''
      #update_view
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
