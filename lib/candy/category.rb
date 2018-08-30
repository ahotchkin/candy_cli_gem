class Candy::Category
  attr_accessor :name, :url, :candies

  @@all = []

  def initialize(name = nil, url = nil, candies = nil)
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

  def add_candies(candy)
    candy = Candy::Candy.new
    @candies << candy
    candy.category = self
  end

  def list_candies
    @candies.each.with_index(1) do |candy|
      puts "#{i}. #{candy} - #{candy.price}"
    end
  end    

end
