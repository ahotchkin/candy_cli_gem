class InvalidType < StandardError; end

class Candy::Category
  attr_accessor :name, :url, :candies

  @@all = []

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    @candies = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_all
    @@all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

  def add_candy(candy)
    if !candy.is_a?(Candy::Candy)
      raise InvalidType, "must be a Candy"
    else
      @candies << candy
    end
  end

  def list_candies
    puts "-----------------------------------#{self.name.upcase}-----------------------------------"
    puts "Click on any candy link for more information:"
    puts "----------------------------------------------------------------------" + "-" * self.name.length

    @candies.each.with_index(1) do |candy, i|
      puts "#{i}. #{candy.name} - #{candy.price}"
      if i.between?(1,9)
        puts "   #{candy.url}"
      else
        puts "    #{candy.url}"
      end
      puts "----------------------------------------------------------------------" + "-" * self.name.length
    end
    
  end

end
