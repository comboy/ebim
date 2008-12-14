#include_class "gui.main.contact_partial.ContactPartial"
require 'contact_partial/contact_partial_renderer'

class MainModel

  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def renderer
    #i = ContactPartielController.
    @renderer ||= ContactPartialRenderer.new
  end
end
