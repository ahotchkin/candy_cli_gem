class Candy::Candy
  attr_accessor :name, :price, :url, :category

  # @@all = []

  def initialize(name = nil, price = nil, url = nil)
    @name = name
    @price = price
    @url = url
    # @@all << self
  end

  def category
    self.category.name
  end

  # def self.all
  #   @@all
  # end
  #
  # def self.list_all
  #   @@all.each.with_index(1) do |candy, i|
  #     puts "#{i}. #{candy.name} - #{candy.price}"
  #   end
  # end


end
