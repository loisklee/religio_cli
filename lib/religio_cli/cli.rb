class ReligioCLI::CLI

  def call
    ReligioCLI::Scraper.initiate_scraper
    puts "Hello there! Welcome to Religio. I offer information on the top 50 Major Religious traditions. Please see the list below, presented in alphabetical order."
    puts " "
    menu
  end

  def list_religions
    ReligioCLI::Trads.all.each.with_index(1) do |religion, index|
      puts "#{index}. #{religion.name}"
    end
  end

  def display_religion(integer)
    user_selection = ReligioCLI::Trads.all[integer-1]
    puts " "
    puts user_selection.name
    puts user_selection.quick_facts
    puts "\n\t#{user_selection.description}"
    puts " "
    puts "To learn more, visit:"
    puts user_selection.url
  end

  def menu
    list_religions
    puts "For details on a particular tradition, type the number associated."
    puts "To exit at any time, enter 'exit'."
    puts "Which religious tradition would you like to learn more about?"
    choice = nil
    choice = gets.strip
    if choice.to_i > 0 && choice.to_i <= ReligioCLI::Trads.all.length
      display_religion(choice.to_i)
      puts "Would you like to learn more about another religion?"
      puts "Enter Y or N"
      input = gets.strip.downcase
      if input == "y"
        menu
      elsif input == "n"
        goodbye
        exit
      elsif input == "exit"
        goodbye
        exit
      else
        puts "I'm not sure what you'd like. Please see the below the list:"
        menu
      end
    elsif choice == "exit".downcase
      goodbye
    else
      puts "I'm not sure what you'd like. Please enter a number between 1 and 50. If you want to leave, enter 'exit'."
      menu
    end
  end

  def goodbye
    puts "Thanks for exploring! We hope you learned something cool today. Feel free to visit anytime : )"
  end

end
