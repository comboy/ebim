class AboutView < ApplicationView
  set_java_class 'gui.about.AboutFrame'

  def load
    move_to_center
  end
end
