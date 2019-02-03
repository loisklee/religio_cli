class ReligioCLI::CLI

  def call
    puts "Hello there! Welcome to Religio. I offer information on the top 50 Major Religious traditions. Please see the list below, presented in alphabetical order."
    puts " "
    display_list
    menu
    goodbye
  end

  def list_religions

  end

  def display_religion(integer)

  end

  def menu
    puts "For details on a particular tradition, type the number associated."
    puts "To exit at any time, enter 'exit'."
    puts "Which religious tradition would you like to learn more about?"
  end

  def goodbye
    puts "Thanks for exploring! We hope you learned something cool today. Feel free to visit anytime : )"
  end

end
