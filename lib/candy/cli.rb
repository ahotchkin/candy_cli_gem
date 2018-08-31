class Candy::CLI

  def call
    Candy::Scraper.new.make_categories
    puts "Welcome to the official Candy.com Sweets app!"
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
    Candy::Category.list_all
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
        puts ""
        category = Candy::Category.all[category_input.to_i-1]
        Candy::Scraper.new.make_candy(category)
        category.list_candies
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
