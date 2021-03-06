include_class javax.swing.tree.DefaultMutableTreeNode
include_class javax.swing.DefaultComboBoxModel
include_class javax.swing.MutableComboBoxModel
include_class javax.swing.DefaultComboBoxModel


#include_class "gui.main.contact_partial.ContactPartial"
require 'contact_partial/contact_partial_renderer'
require 'presence_list_renderer'

class MainModel

  attr_reader :contacts
  attr_accessor :selection_path
  attr_reader :available_presences
  attr_accessor :presence_selected_item

  def initialize
    @contacts = []
    @presence_selected_item = :unavailable
  end

  def selection_path=(x)
    puts "[I am doing nothing] Selection path#{x}"
  end

  def renderer
    #i = ContactPartielController.
    @renderer ||= ContactPartialRenderer.new
  end

  def presence_list_renderer
    puts "getting presence list renderer"
    @presence_list_renderer ||= PresenceListRenderer.new    
  end

  def presence_list_model
    @presence_model ||= build_presence_list_model    
  end

  def contacts=(contacts)
    @contacts = contacts
    @tree_model = nil
  end

  def contact_for_jid(jid)
    @contacts.find {|c| c.jid == jid}
  end


  def build_presence_list_model
    begin
    model = DefaultComboBoxModel.new
    model.add_element :available
    model.add_element :chat
    model.add_element :dnd
    model.add_element :away
    model.add_element :unavailable
    model
    rescue Exception => ex
      puts "EX! #{ex}"
    end
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
    groups = contact.groups
    groups = ['Bez grupy'] if groups.empty?
      #if contact.groups.empty?#nil? || contact.groups.empty?
      #  puts "no contact groups"
      #else
        groups.each do |group|
          if @group_handles[group]
            #
          else
            group_item = DefaultMutableTreeNode.new(group, true)
            @group_handles[group] = group_item
            root.add group_item
          end
          @group_handles[group].add DefaultMutableTreeNode.new(contact, false)
        end
      #end
    end
    #search_results.each_with_index do |photo, index|
      #root.add DefaultMutableTreeNode.new("hello", false)
      #root.add DefaultMutableTreeNode.new(::Ebim::Base::Contact.new('','ueo'), false)
    #end
    javax.swing.tree.DefaultTreeModel.new(root, true)
  end

  def available_presences
    
  end

end
