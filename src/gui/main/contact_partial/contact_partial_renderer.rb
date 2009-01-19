include_class "javax.swing.JTree"
include_class "javax.swing.tree.TreeCellRenderer"
include_class "javax.swing.tree.DefaultTreeCellRenderer"

require 'contact_partial_controller'

class ContactPartialRenderer
  include TreeCellRenderer

  #def getTreeCellRendererComponent(JTree tree, Object value, boolean selected, boolean expanded, boolean leaf, int row, boolean hasFocus) {
  def get_tree_cell_renderer_component(tree, value, selected, expanded, leaf, row, hasFocus)

    if leaf
      i = ContactPartialController.create_instance
      i.selected = selected
      i.set_contact value.user_object#.java_object      
      i.get_java_window
    else
      default = DefaultTreeCellRenderer.new
      #include_class 'gui.main.MainFrame'
      begin
      default.open_icon = ImageIcon.new(MainView.fokin_szit.get_resource("/gui/images/triangle-d.gif"));
      default.closed_icon = ImageIcon.new(MainView.fokin_szit.get_resource("/gui/images/triangle-l.gif"));
      rescue Exception => ex
        puts "!!!!!!!!!!! #{ex}"
      end
      default.get_tree_cell_renderer_component(tree, value, selected, expanded,
            leaf, row, hasFocus);
    end
  end
end