include_class 'javax.swing.DefaultListCellRenderer'

class PresenceListRenderer < DefaultListCellRenderer

  def initialize
    puts "creating new list renderer"
  end
  
  def getListCellRendererComponent(list, value, index, isSelected, cellHasFocus)
    #puts "plist renderer: getting element"
      label = super
      #puts "setting icon..."
      label.icon = MainView.icon_for_presence(value);
      label.text = MainView.name_for_presence(value);
      label
  end
end
