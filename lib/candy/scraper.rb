class Candy::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.candy.com/sweets"))
  end

  def scrape_index_page
    self.get_page.css("div.categoryListItem-inner")
  end

  def make_categories
    self.scrape_index_page.each do |category|
      Candy::Category.new(
        category.css("h2.candy-subcat-titles").text.strip.gsub(/[\n]/, ""),
        category.css("a").attribute("href").value
      )
    end
  end

  def get_category_page(category)
    Nokogiri::HTML(open(category.url))
  end

  def scrape_category_page(category)
    self.get_category_page(category).css("div.productListItem-content")
  end

  def make_candy(category)
    self.scrape_category_page(category).each do |candy_type|
      candy = Candy::Candy.new(
        candy_type.css("h3").text,
        candy_type.css("span.regular-price").text.strip.gsub(/[\n]/, ""),
        candy_type.css("h3 a").attribute("href").value
      )
      category.add_candy(candy)
    end
  end

end
