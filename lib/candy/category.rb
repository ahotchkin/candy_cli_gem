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
    @candies.each.with_index(1) do |candy, i|
      puts "#{i}. #{candy.name} - #{candy.price}"
    end
  end

end
