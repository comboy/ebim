class AddContactView < ApplicationView
  set_java_class 'gui.add_contact.AddContactFrame'

  def load
    move_to_center
  end
end
