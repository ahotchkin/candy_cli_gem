class Candy::Category
  attr_accessor :name, :url

  @@all = []

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_all
    self.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category}"
    end
  end

end
