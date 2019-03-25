class ReligioCLI::CLI

  def call
    ReligioCLI::Scraper.initiate_scraper
    puts "Hello there! Welcome to Religio. I offer information on the top 50 Major Religious traditions. To see the list presented in alphabetical order, enter 'list'. To exit, enter 'exit'."
    input = nil
    input = gets.strip.downcase
    if input == "list"
        list_religions
        menu
    elsif input == "exit"
      goodbye
      exit
    else
      puts "I'm not sure what you'd like. Please see the below the list:"
      list_religions
      menu
    end
  end

  def list_religions
    ReligioCLI::Trads.all.each.with_index(1) do |religion, index|
      puts "#{index}. #{religion.name}"
    end
  end

  def display_religion(user_selection)
    puts " "
    puts user_selection.name.upcase
    puts " "
    puts user_selection.quick_facts
    puts " "
    puts user_selection.description
    puts " "
    puts "To learn more, visit:"
    puts user_selection.url
  end

  def menu
    puts "For details on a particular tradition, type the number associated."
    puts "To exit at any time, enter 'exit'."
    puts "Which religious tradition would you like to learn more about?"
    choice = nil
    choice = gets.strip
    if choice.to_i > 0 && choice.to_i <= ReligioCLI::Trads.all.length
      selected_religion = ReligioCLI::Trads.all[choice.to_i-1]
      ReligioCLI::Scraper.religion_scraper_details(selected_religion) unless selected_religion.description != nil
      display_religion(selected_religion)
      puts "Would you like to learn more about another religion?"
      puts "Enter Y or N"
      input = gets.strip.downcase
      if input == "y"
        list_religions
        menu
      elsif input == "n"
        goodbye
        exit
      elsif input == "exit"
        goodbye
        exit
      else
        puts "I'm not sure what you'd like. Please see the below the list:"
        list_religions
        menu
      end
    elsif choice == "exit".downcase
      goodbye
    else
      puts "I'm not sure what you'd like. Please enter a number between 1 and 50. If you want to leave, enter 'exit'."
      list_religions
      menu
    end
  end

  def goodbye
    puts "Thanks for exploring! I hope you learned something cool today. Feel free to stop by anytime :)"
  end

end
