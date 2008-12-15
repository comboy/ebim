include_class "gui.main.MainFrame"

class MainFrameClass < MainFrame
  
  def initialize
    super
    jebane_drzewko.add_tree_selection_listener MyTreeSelectionListener.new
  end

  class MyTreeSelectionListener
    include javax.swing.event.TreeSelectionListener
    def value_changed(e)
      puts "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWw"
      puts "e: #{e}"
    end
  end
end

