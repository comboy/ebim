class MainController < ApplicationController
  set_model 'MainModel'
  set_view 'MainView'
  set_close_action :exit


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
    update_view
  end

end
