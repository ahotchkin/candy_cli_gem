class Candy::CLI

  def call
    puts "Welcome to the official Candy.com sweets app!"
    menu
    list_categories
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
    puts "Candy.com Sweets:"
    puts ""
    puts "1. Candy Canes"
    puts "2. Candy Corn"
    puts "3. Candy Sticks"



    # Candy::Category.list_all

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

      # if category_input.to_i.between?(1, Candy::Category.all.length)
      #   category = NYStateFairEvents::Concert.all[category_input.to_i-1]
      #   category.category_details
      if category_input.to_i == 1
        puts "1. SPANGLER Individually Wrapped Mini Peppermint Candy Canes Bulk, 500 Count"
        # puts "$29.95"
        # puts "For more information visit: https://www.candy.com/spangler-mini-peppermint-candy-canes-bulk-500-count"
        puts "2. Spangler Peppermint Candy Cane Jar, 60 count"
        # puts "$29.95"
        # puts "For more information visit: https://www.candy.com/spangler-peppermint-candy-cane-jar-60-count"
        puts "3. Spangler Cherry Candy Canes, 12 Count, 3 Pack"
        # puts "$9.95"
        # puts "For more information visit: https://www.candy.com/spangler-cherry-candy-canes-12-pieces-3-count"
        puts <<-DOC.gsub /^\s*/, ""
          Enter a candy number to see details on that candy. Otherwise, enter one of the following prompts:
          - Enter 'menu' to see the main menu
          - Enter 'exit' to exit
        DOC
        puts ""
      elsif category_input.to_i == 2
        puts "1. Individually Wrapped Candy Corn 1.5 oz, 5 lb"
        # puts "$24.95"
        # puts "For more information visit: https://www.candy.com/candy-corn-individual-packs-5-lbs-80-count"
        puts <<-DOC.gsub /^\s*/, ""
          Enter a candy number to see details on that candy. Otherwise, enter one of the following prompts:
          - Enter 'menu' to see the main menu
          - Enter 'exit' to exit
        DOC
        puts ""
      elsif category_input.to_i == 3
        puts "1. Classic Lobster 1 oz 12 Count"
        # puts "$29.95"
        # puts "For more information visit: https://www.candy.com/classic-lobster-1-oz-12-count"
        puts "2. Lobster Claw 1 oz 12 Count"
        # puts "$29.95"
        # puts "For more information visit: https://www.candy.com/lobster-claw-1-oz-12-count"
        puts "3. Seacoast Whale Tail 1 oz 12 Count"
        # puts "$29.95"
        # puts "For more information visit: https://www.candy.com/seacoast-whale-tail-1-oz-12-count"
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
