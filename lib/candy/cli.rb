class Candy::CLI

  def call
    puts "Welcome to the official Candy app!"
    list_categories
  end

  def list_categories
    puts "1. Candy Canes"
    puts "2. Candy Corn"
    puts "3. Candy Sticks"
  end


end
