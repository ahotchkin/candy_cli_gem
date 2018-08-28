class Candy::Candy
  attr_accessor :name, :category, :price, :url

  @@all = []

  def initialize(name = nil, category = nil, price = nil, url = nil)
    @name = name
    @category = category
    @price = price
    @url = url
    @@all = []
  end

  def self.all
    @@all
  end

  def self.list_all
    self.all.each.with_index(1) do |candy, i|
      puts "#{i}. #{candy} - #{candy.price}"
    end
  end


end
