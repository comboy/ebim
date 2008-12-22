class MessageModel
  attr_accessor :contact
  attr_accessor :talk
  attr_accessor :new_message

  def initialize
    @talk = '<html><hr>'
  end

  def window_title
    "Rozmowa z #{@contact.name}" if @contact
  end

end
