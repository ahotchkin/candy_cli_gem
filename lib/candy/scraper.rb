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
        category.css("h2.candy-subcat-titles").text.gsub(/[ \n]/, ""),
        category.css("a").attribute("href").value
      )
    end
  end

  def get_category_page(category)
    Nokogiri::HTML(open(category.url))
  end

  def scrape_category_page
    self.get_category_page(category).css("div.productListItem-content")
  end

  def make_candy
    self.get_category_page(category).collect do |candy|
      Candy::Candy.new(
        candy.css("h3 title").text,
        candy.css("span.regular-price").text.gsub(/[ \n]/, ""),
        candy.css("h3 a").attribute("href").value
      )
    end
  end

end
