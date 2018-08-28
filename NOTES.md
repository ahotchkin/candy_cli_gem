NOTE: PROJECT IN PROGRESS AS OF 8/28/18.


CandyCLI will be a command-line app to allow a user to see a list of candy available at Candy.com. When they run the app, they will see a greeting and be asked to enter a prompt.

Prompts:
1. Candy - will provide a numbered list of all candy categories; data scraped from this website: https://www.candy.com/sweets
2. Help - will provide directions on how to use the app
3. Exit - will exit the app

From the candy category list view, the user will have three options:
1. Enter a number associated with candy category to see a numbered list of all candy available in that category
  - Attempt to have the candy name be a hyperlink to the url so the user can click on it to go to the webpage
2. Enter 'menu' to go back to the main menu
3. Enter 'exit' to exit

From the candy list view, the user will have three options:
1. Enter a number associated with a candy to see details: price, url
2. Enter 'menu' to go back to the main menu
3. Enter 'exit' to exit

Architecture:
  - Candy Category class to represent each candy category
  - Candy class to represent each candy
  - Scraper class to do the scraping of the site and create the candy categories and candies
  - CandyCLI to interact with the user

First version: A user will see the greeting and be asked to enter a prompt. If they choose 'candy’ they’ll see a list of fake data that we hardcode into the app.


Scraping Practice

Candy Categories

Category
doc.css('div.catalogNavigation-categories ul li’)[i].text.gsub(/[\n\t]/, "")

Category Link
link: links[i]

links = doc.css(‘div.catalogNavigation-categories ul li a').map do |link|
		      link.attr(‘href’)
	      end


Candy
link.css('h3’)[i].text

Candy Price
link.css(‘span.price’)[i].text

Candy Link
Candy_Link = candylinks[i]

candylinks = link.css(‘h3 a’).map do |link|
			         link.attr(‘href’)
		         end
