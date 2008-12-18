class MessageView < ApplicationView
  set_java_class 'gui.message.MessageFrame'

  map :view => "info_label.text", :model => 'contact', :using => :contact_label
  map :view => "talk_text_pane.text", :model => 'talk'


  def contact_label(contact)
    return "???" unless contact
    "<html><b>#{contact.name}</b><br>\n<i>#{contact.status}</i>"
  end

end
