class Candy::CLI

  def call
    Candy::Scraper.new.make_categories
    puts "Welcome to the official Candy.com sweets app!"
    menu
  end

  def menu
    menu_input = ""
    while menu_input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        What would you like to do?
        - Enter 'candy' to see a list of all candy categories
        - Enter 'help' for instructions
        - Enter 'exit' to exit
      DOC
      puts ""
      menu_input = gets.strip.downcase

      if menu_input == "candy"
        list_categories
      elsif menu_input == "help"
        puts ""
        puts "This app is designed to provide information on all candy available in the 'Sweets' section of Candy.com. Follow the prompts for event details."
        puts ""
      elsif menu_input != "exit"
        puts ""
        puts "I'm sorry, I didn't catch that."
      elsif menu_input == "exit"
        goodbye
      end
    end
  end

  def list_categories
    puts ""
    puts "am i getting here?"
    Candy::Category.list_all
    puts "but what about here?"
    puts ""

    category_input = ""
    while category_input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        Enter a category number to see a list of all available candy in that category. Otherwise, enter one of the following prompts:
        - Enter 'menu' to see the main menu
        - Enter 'exit' to exit
      DOC
      puts ""
      category_input = gets.strip.downcase

      if category_input.to_i.between?(1, Candy::Category.all.length)
        # category = Candy::Category.all[category_input.to_i-1]
        # List out all candy in a given category
        puts "Click on any candy below for more information"
        category = Candy::Category.all[category_input.to_i-1]
        category.list_candies

    #       candy.list_all
    #     end
    #   # if category_input.to_i == 1
    #   #   puts "1. SPANGLER Individually Wrapped Mini Peppermint Candy Canes Bulk, 500 Count - $29.95"
    #   #   # puts "For more information visit: https://www.candy.com/spangler-mini-peppermint-candy-canes-bulk-500-count"
    #   #   puts "2. Spangler Peppermint Candy Cane Jar, 60 count - $29.95"
    #   #   # puts "For more information visit: https://www.candy.com/spangler-peppermint-candy-cane-jar-60-count"
    #   #   puts "3. Spangler Cherry Candy Canes, 12 Count, 3 Pack - $9.95"
    #   #   # puts "For more information visit: https://www.candy.com/spangler-cherry-candy-canes-12-pieces-3-count"
    #   #   puts <<-DOC.gsub /^\s*/, ""
    #   #     Enter a candy number to see details on that candy. Otherwise, enter one of the following prompts:
    #   #     - Enter 'menu' to see the main menu
    #   #     - Enter 'exit' to exit
    #   #   DOC
    #     puts ""
      elsif category_input == "menu"
        menu
      elsif category_input != "exit"
        puts ""
        puts "I'm sorry, I didn't catch that."
      elsif category_input == "exit"
        goodbye
      end
    end
  end

  def goodbye
    puts ""
    puts "We hope you enjoy a sweet treat! But don't spoil your dinner :)"
    puts "Goodbye!"
    puts ""
    exit
  end


end
