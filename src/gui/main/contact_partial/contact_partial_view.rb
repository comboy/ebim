class ContactPartialView < ApplicationView
  set_java_class 'gui.main.contact_partial.ContactPartialPanel'
  #set_java_class 'ContactPartial'

  map :view => 'name_label.text', :model => 'contact_name'
end
