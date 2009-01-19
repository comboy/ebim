class PreferencesView < ApplicationView
  set_java_class 'gui.preferences.PreferencesFrame'

  map :view => 'textfield_jid.text', :model => :jid
  map :view => 'password_field.text', :model => :password
  map :view => 'combo_box_skin.selected_item', :model => :skin

  def load
    move_to_center    
  end

  define_signal :name => :repaint, :handler => :repaint
  def repaint(model,transfer)
    javax.swing.SwingUtilities.updateComponentTreeUI(java_window);
  end
end
