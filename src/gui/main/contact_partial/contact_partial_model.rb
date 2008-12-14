class ContactPartialModel
  attr_accessor :contact

  def label
    #"watta"
    pp @contact

    puts "hmmmmmmmm"
    puts @contact.class
    if @contact.nil?
      "-"
    else
      puts @contact.name
      if @contact.presence == :unavailable
        "<html>#{@contact.name}<br>srak"
      else
        "<html><b>#{@contact.name}</b>#{(status.empty? ? '' : "<br><i>#{status}</i>")}"
      end
    end
  end

  def presence
    @contact.presence
  end

  def status
    @contact.status
  end
end
