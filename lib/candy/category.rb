class Candy::Category
  attr_accessor :name, :url

  def initialize(@name = nil, @url = nil)
    @name = name
    @url = url
  end

end
