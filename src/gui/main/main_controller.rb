class MainController < ApplicationController
  set_model 'MainModel'
  set_view 'MainView'
  set_close_action :exit


  # Coming from outside
  def set_roster_items(items)
    model.contacts = items
  end

end
