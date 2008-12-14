class ContactPartialModel
  attr_accessor :contact

  def contact_name
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
end
