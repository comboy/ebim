include_class "javax.swing.ImageIcon"

class ContactPartialView < ApplicationView
  set_java_class 'gui.main.contact_partial.ContactPartialPanel'
  #set_java_class 'ContactPartial'

  map :view => 'name_label.text', :model => 'label'
  map :view => 'name_label.icon', :model => 'presence', :using => :status_to_icon

  def status_to_icon(status)
    #name_label.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gui/images/status/available.png")));
    ImageIcon.new(java_window.get_class.get_resource("/gui/images/status/busy.png"));
  end
end
