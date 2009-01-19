require 'main_frame_class'
class MainView < ApplicationView
  @@fokin_szit = nil
  set_java_class 'gui.main.MainFrame'
  #set_class 'MainFrameClass'

  map :view => "contacts_tree.model", :model => 'tree_model'#, :using => [:build_tree_nodes, nil]
  map :view => "contacts_tree.cell_renderer", :model => 'renderer'
  map :view => "combo_box_presence.model", :model => 'presence_list_model'#, :using => [:build_tree_nodes, nil]
  map :view => "combo_box_presence.renderer", :model => 'presence_list_renderer'
  map :view => "combo_box_presence.selected_item", :model => 'presence_selected_item'
  map :view => "contacts_tree.selection_rows", :model => :selection_path#, :using => [:one,:two]

  define_signal :name => :get_row, :handler => :get_row

  def get_row(model,transfer)
    #puts "getting row"
    row = contacts_tree.get_last_selected_path_component
    #pp row
    transfer[:row] = row
  end

  define_signal :name => :refresh_contacts, :handler => :refresh_contacts

  def refresh_contacts(model,transfer)
    begin
    contacts_tree.invalidate
    contacts_tree.repaint
    #puts "WWWWWWWWWWWWWWWWWWWWWWWWOOOOOOOOOOOOOO"
    #puts contacts_tree.parent
    #puts contacts_tree.layout
    rescue Exception => ex
      puts "!!!!!!!!!!! #{ex}"
    end
  end

  define_signal :name => :expand_all, :handler => :expand_all
  def expand_all(model,transfer)
    0.upto(contacts_tree.row_count) do |i|
        contacts_tree.expand_row i         
    end
    puts "expanding all.."
  end

  #def initialize
  #  @contact_handles = Hash.new []
  #  @group_handles = {}
  #end

  attr_accessor :contact_handles

  #def load
  # contacts_tree.cell_renderer = model.renderer
  #end

#  def initialize(*args,&block)
#    super
#  end

  def load
    @@fokin_szit = java_window.get_class
    #puts "ojeeeeeeeeeeeeeeeeeeeeeeeeeeeeej"
    #puts java_window.get_class
    #puts java_window.get_class.class
    #include_class 'gui.main.MainFrame'
    #puts Java::GuiMain::MainFrame#const_get('gui.main.MainFrame')
    #puts Java::GuiMain::MainFrame.class#const_get('gui.main.MainFrame')
    if last_location = Ebim::Base.instance.config[:main_window_location]
      @main_view_component.set_location(*last_location)
    else
      move_to_center
    end
    #java_window.position.y = 300

  end

  def unload
    puts "Claaaaaaaaaaaasing"
    Ebim::Base.instance.config[:main_window_location] = [
      @main_view_component.location.x,
      @main_view_component.location.y
    ]
  end

  def self.fokin_szit
    @@fokin_szit
  end

    # commons

  def self.icon_for_presence(presence)
    #name_label.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gui/images/status/available.png")));
    #puts "WTF {#{presence}}"
    presence = :unavailable if presence.to_s == ''    
    image = case presence.to_sym
    when :dnd
      'busy.png'
    when :available
      'available.png'
    when :away
      'away.png'
    when :unavailable
      'offline.png'
    when :chat
      'chat.png'
    else
      'person.png'
    end
    # this looks just bad
    include_class 'gui.main.MainFrame'
    ImageIcon.new(@@fokin_szit.get_resource("/gui/images/status/#{image}"));
  end


  PRESENCE_NAMES = {
    :available => 'Dostępny',
    :dnd => 'Nie przeszkadzać',
    :away => 'Zaraz wracam',
    :chat => 'Chętny :>',
    :unavailable => 'Niedostępny'
  }

  def self.name_for_presence(presence)
    PRESENCE_NAMES[presence.to_sym]
  end


end
