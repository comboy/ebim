class PreferencesModel

  attr_accessor :jid
  attr_accessor :password
  attr_accessor :skin

  def initialize
    @config = Ebim::Base.instance.config
    @jid = @config[:jid]    
    @password = @config[:password]
  end
#
#  def jid
#    @jid
#  end
#
#  def jid=(jid)
#    @jid = jid if jid && !jid.empty?
#  end


end
