class CliEplTable::Sorter
  def self.sorted_data
    team_data = CliEplTable::Scraper.scrape_site.search('tbody tr[data-compseason="274"]')

    team_array = []
    team_data.each {|team| team_array << team}
    team_array
  end
end