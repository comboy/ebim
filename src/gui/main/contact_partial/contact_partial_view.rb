include_class "javax.swing.ImageIcon"

class ContactPartialView < ApplicationView
  set_java_class 'gui.main.contact_partial.ContactPartialPanel'
  #set_java_class 'ContactPartial'

  map :view => 'name_label.text', :model => 'label'
  map :view => 'name_label.icon', :model => 'presence', :using => :presence_to_icon
  map :view => 'name_label.background', :model => 'background'

  def presence_to_icon(presence)
    MainView.icon_for_presence presence
#    #name_label.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gui/images/status/available.png")));
#    puts "WTF {#{presence}}"
#    presence = :unavailable if presence.to_s == ''
#    image = case presence.to_sym
#    when :dnd
#      'busy.png'
#    when :available
#      'available.png'
#    when :away
#      'away.png'
#    when :unavailable
#      'offline.png'
#    when :chat
#      'chat.png'
#    else
#      'person.png'
#    end
#    ImageIcon.new(java_window.get_class.get_resource("/gui/images/status/#{image}"));
  end

  define_signal :name => :get_java_window, :handler => :get_java_window

  def get_java_window(model,transfer)
    transfer[:java_window] = java_window
  end

  def load
    java_window.maximum_size = nil
    java_window.minimum_size = nil
    java_window.preferred_size = nil
    #puts "loading partial.. parent: #{java_window.parent}"

  end



end
