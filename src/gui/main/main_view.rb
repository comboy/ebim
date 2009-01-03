require 'main_frame_class'
class MainView < ApplicationView
  set_java_class 'gui.main.MainFrame'
  #set_class 'MainFrameClass'

  map :view => "contacts_tree.model", :model => 'tree_model'#, :using => [:build_tree_nodes, nil]
  map :view => "contacts_tree.cell_renderer", :model => 'renderer'
  map :view => "contacts_tree.selection_rows", :model => :selection_path#, :using => [:one,:two]
  #map("contacts_tree.selection_rows").to(:seloction_path)
#  map :view => "photos_tree.model.root.user_object", :model => :search_terms, :using => [:default, nil]

  define_signal :name => :get_row, :handler => :get_row

  def get_row(model,transfer)
    puts "getting row"
    row = contacts_tree.get_last_selected_path_component
    pp row
    transfer[:row] = row
  end

  define_signal :name => :refresh_contacts, :handler => :refresh_contacts

  def refresh_contacts(model,transfer)
    contacts_tree.repaint
  end

  #def initialize
  #  @contact_handles = Hash.new []
  #  @group_handles = {}
  #end

  attr_accessor :contact_handles

  #def load
  # contacts_tree.cell_renderer = model.renderer
  #end

  def load
    "ojeeeeeeeeeeeeeeeeeeeeeeeeeeeeej"
  end


end
