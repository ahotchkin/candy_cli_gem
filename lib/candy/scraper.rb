class Candy::Scraper
  # attr_accessor :category
  #
  # def initialize(name)

  def get_page
    Nokogiri::HTML(open("https://www.candy.com/sweets"))
  end

  def scrape_index_page
    self.get_page.css("div.categoryListItem-inner")
  end

  def make_categories
    self.scrape_index_page.each do |category|
      Candy::Category.new(
        category.css("h2.candy-subcat-titles").text.gsub(/[ \n]/, ""),
        category.css("a").attribute("href").value
      )
    end
  end

  def get_category_page(category)
    Nokogiri::HTML(open(category.url))
  end
  # 
  # def get_category_page
  #   Nokogiri::HTML(open("https://www.candy.com/sweets/candy-canes"))
  # end

  def scrape_category_page(category)
    self.get_category_page(category).css("div.productListItem-content")
  end

  # def scrape_category_page
  #   self.get_category_page.css("div.productListItem-content")
  # end

  def make_candy(category)
    self.scrape_category_page(category).each do |candy|
      Candy::Candy.new(
        candy.css("h3").text,
        candy.css("span.regular-price").text.gsub(/[ \n]/, ""),
        candy.css("h3 a").attribute("href").value
      )
    end
  end

  # def scrape_candy(category)
  #   self.scrape_category_page(category).each do |category_page|
  #     candy = Candy::Candy.new
  #     candy.name = category_page.css("h3").text
  #     candy.price = category_page.css("span.regular-price").text.gsub(/[ \n]/, "")
  #     candy.url = category_page.css("h3 a").attribute("href").value
  #
  #     @category.add_candy(candy)
  #   end
  # end

end
