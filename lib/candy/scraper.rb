class Candy::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.candy.com/sweets"))
  end

  def scrape_index_page
    self.get_page.css("div.catalogNavigation-categories")
  end

  def make_categories
    self.scrape_index_page.collect do |category|
      Candy::Category.new(
        category.css("ul li").text.gsub(/[\t\n]/, ""),
        category.css("a").attr("href")
      )
    end
  end

  def get_category_page (category)
    Nokogiri::HTML(open("category.url"))
  end

  def scrape_category_page(category)
    self.get_category_page.css
  end

  def make_candy
    self.get_category_page.collect do |candy|
      Candy::Candy.new(
        candy.css("h3").text,
        candy.css("div catalogTitle h1").text,
        candy.css("span.price").text,
        candy.css("h3 a").attr("href")
      )
    end
  end

end
