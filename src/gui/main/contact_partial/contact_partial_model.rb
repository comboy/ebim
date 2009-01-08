class ContactPartialModel
  attr_accessor :contact
  attr_accessor :selected

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
        "<html>#{@contact.name}<br>bardzo długi opis ciekawe co się z tym stanie hehe hehe ehe "
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

  def background
    @selected ? java.awt.Color.blue : java.awt.Color.yellow
  end
end
