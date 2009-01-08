class AddContactView < ApplicationView
  set_java_class 'gui.add_contact.AddContactFrame'

  map :view => "textfield_jid.text", :model => :jid
  map :view => "textfield_name.text", :model => :name


  def load
    move_to_center
  end
end
