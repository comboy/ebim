class PreferencesView < ApplicationView
  set_java_class 'gui.preferences.PreferencesFrame'

  def load
    move_to_center
  end
end
