class MessageController < ApplicationController
  set_model 'MessageModel'
  set_view 'MessageView'
  set_close_action :exit
end
