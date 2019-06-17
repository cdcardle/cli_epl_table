require 'nokogiri'
require 'open-uri'

class CliEplTable::Scraper
  # scrape premierleague.com/tables for the html
  def self.scrape_site
    doc = Nokogiri::HTML(open("https://www.premierleague.com/tables"))
  end
end