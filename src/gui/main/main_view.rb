include_class javax.swing.tree.DefaultMutableTreeNode

class MainView < ApplicationView
  set_java_class 'gui.main.MainFrame'

  map :view => "contacts_tree.model", :model => :contacts_tree, :using => [:build_tree_nodes, nil]
#  map :view => "photos_tree.model.root.user_object", :model => :search_terms, :using => [:default, nil]

  def build_tree_nodes(search_results)
    root = DefaultMutableTreeNode.new("updating...", true)
    #search_results.each_with_index do |photo, index|
      root.add DefaultMutableTreeNode.new("hello", false)
      root.add DefaultMutableTreeNode.new(Ebim::Base::Contact.new('','ueo'), false)
    #end
    javax.swing.tree.DefaultTreeModel.new(root, true)
  end


end
