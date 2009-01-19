class AboutController < ApplicationController
  set_model 'AboutModel'
  set_view 'AboutView'
  set_close_action :close

  def button_close_action_performed
    close
  end
end
