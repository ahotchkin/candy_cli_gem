class Candy::Candy
  attr_accessor :name, :price, :url
  # should :category be an attr_accessor?


  # DON'T NEED THESE???

  def initialize(name = nil, price = nil, url = nil)
    @name = name
    @price = price
    @url = url
  end
  #
  # def category
  #   self.category.name
  # end


end
