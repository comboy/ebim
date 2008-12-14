include_class "javax.swing.ImageIcon"

class ContactPartialView < ApplicationView
  set_java_class 'gui.main.contact_partial.ContactPartialPanel'
  #set_java_class 'ContactPartial'

  map :view => 'name_label.text', :model => 'label'
  map :view => 'name_label.icon', :model => 'presence', :using => :presence_to_icon

  def presence_to_icon(presence)
    #name_label.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gui/images/status/available.png")));
    puts "WTF {#{presence}}"
    presence = :unavailable if presence.to_s == ''
    image = case presence.to_sym
    when :dnd
      'busy.png'
    when :available
      'available.png'
    when :away
      'away.png'
    when :unavailable
      'offline.png'
    when :chat
      'chat.png'
    else
      'person.png'
    end
    ImageIcon.new(java_window.get_class.get_resource("/gui/images/status/#{image}"));
  end
end
