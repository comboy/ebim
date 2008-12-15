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
      i.view.get_field_value("java_window")
    else
      default = DefaultTreeCellRenderer.new
      default.get_tree_cell_renderer_component(tree, value, selected, expanded,
            leaf, row, hasFocus);
    end
  end
end