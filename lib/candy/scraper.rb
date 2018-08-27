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

  def make_candy
  end

end
