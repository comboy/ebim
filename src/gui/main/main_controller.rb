class MainController < ApplicationController
  set_model 'MainModel'
  set_view 'MainView'
  set_close_action :exit
end
