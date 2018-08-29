class InvalidType < StandardError; end

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
    if !candy.is_a?(Candy)
      raise InvalidType, "must be a Candy"
    else
      @candies << candy
    end
  end

end
