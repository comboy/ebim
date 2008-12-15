class MainController < ApplicationController
  set_model 'MainModel'
  set_view 'MainView'
  set_close_action :exit


 add_listener :type => :mouse, :components => [:contacts_tree]

  def contacts_tree_mouse_released(bla)
    
    puts "THUENTOHEUNTOHUNSETH"
    puts "===========#{bla} (#{bla.class}"
    if bla.getClickCount == 2
      puts "OOOOOOOOOOOO_OOOOOOOOOOOOO"
      puts "ooooooo #{model.selection_path}"
    end
  end


#  def contacts_list_mouse_released(view_state,event)
#    puts "ORAJT"
#    puts "ws: #{view_state.inspect}"
#  end
  # Coming from outside
  def set_roster_items(items)
    puts "controller set roster items"
    pp items
    model.contacts = items
#    update_view
#    begin
#      0.upto(view.contacts_tree.row_count) do |i|
#        view.contacts_tree.expand_row(i)
#      end
#    rescue Exception => ex
#      puts "AAAAAAAAAAAAAAAAAAAA"
#      puts ex
#
#    end
    update_view
  end

  def temp_easy_update items
    set_roster_items items
  end
  def load
    
  end

  def item_update(blah)
    puts "shold update some"
    begin
      view.contacts_tree.repaint
    rescue Exception => ex
      puts "EEEEEEEEEEEEX #{ex}"
    end
    update_view
  end

end
