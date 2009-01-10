include_class 'javax.swing.DefaultListCellRenderer'

class PresenceListRenderer < DefaultListCellRenderer

  def get_list_cell_renderer_component(list, value, index, isSelected, cellHasFocus)
      label = super
      puts "setting icon..."
      label.text = "watta"
      label.icon = MainView.icon_for_presence(:dnd);
      label
  end
end
