include_class javax.swing.tree.DefaultMutableTreeNode

#include_class "gui.main.contact_partial.ContactPartial"
require 'contact_partial/contact_partial_renderer'

class MainModel

  attr_reader :contacts
  attr_accessor :selection_path
  

  def initialize
    @contacts = []
  end

  def selection_path=(x)
    puts "XXX#{x}"
  end

  def renderer
    #i = ContactPartielController.
    @renderer ||= ContactPartialRenderer.new
  end

  def contacts=(contacts)
    @contacts = contacts
    @tree_model = nil
  end

  def contact_for_jid(jid)
    @contacts.find {|c| c.jid == jid}
  end

  def tree_model
    @tree_model ||= build_tree_nodes(contacts)
  end

    def build_tree_nodes(contacts)

#      puts "build_tree_nodes------------------------------"
#      pp contacts
    # initializer would be nice
    @group_handles = {}
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
