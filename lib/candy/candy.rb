class Candy::Candy
  attr_accessor :name, :category, :price, :url

  def initialize(@name = nil, @category = nil, @price = nil, @url = nil)
    @name = name
    @category = category
    @price = price
    @url = url
  end

end
