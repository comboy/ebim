class ContactPartialModel
  attr_accessor :contact

  def name
    #"watta"
    pp @contact

    puts "hmmmmmmmm"
    puts @contact.class
    if @contact.nil?
      "-"
    else
      puts @contact.name
      @contact.name
    end
  end

  def presence
    :whatevah
  end
end
