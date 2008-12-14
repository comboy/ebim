include_class javax.swing.tree.DefaultMutableTreeNode

class MainView < ApplicationView
  set_java_class 'gui.main.MainFrame'

  map :view => "contacts_tree.model", :model => 'contacts', :using => [:build_tree_nodes, nil]
  map :view => "contacts_tree.cell_renderer", :model => 'renderer'
#  map :view => "photos_tree.model.root.user_object", :model => :search_terms, :using => [:default, nil]

  #def initialize
  #  @contact_handles = Hash.new []
  #  @group_handles = {}
  #end

  def build_tree_nodes(contacts)

    # initializer would be nice
    @group_handles ||= {}
    @contact_handles = Hash.new []

    root = DefaultMutableTreeNode.new("Jabber", true)
    contacts.each do |contact|
      if contact.groups.empty?#nil? || contact.groups.empty?
        puts "no contact groups"
      else
        contact.groups.each do |group|
          if @group_handles[group]
            #
          else
            group_item = DefaultMutableTreeNode.new(group, true)
            @group_handles[group] = group_item
            root.add group_item
          end
          @group_handles[group].add DefaultMutableTreeNode.new(contact, false)
        end
      end
    end
    #search_results.each_with_index do |photo, index|
      #root.add DefaultMutableTreeNode.new("hello", false)
      #root.add DefaultMutableTreeNode.new(::Ebim::Base::Contact.new('','ueo'), false)
    #end
    javax.swing.tree.DefaultTreeModel.new(root, true)
  end


end
