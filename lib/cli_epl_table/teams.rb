class CliEplTable::Teams
  attr_accessor :name, :position, :games_played, :games_won, :games_drawn, :games_lost, :goals_for, :goals_against, :goal_differential, :points
  @@all = []

  # define all
  def self.all
    @@all
  end
  
  # list of teams created by scraping only once
  def self.list
    self.teams unless self.all.length > 0
    self.all
  end

  # get data from CliEplTable::Scraper
  def self.data
    CliEplTable::Scraper.scrape_site
  end

  # use data to create an array of teams with their attributes
  def self.teams
    teams = self.data.search('tbody tr[data-compseason="274"]')

    team_array = []
    teams.each {|team| team_array << team}
    team_array.each do |team|
      new_team = self.new
      new_team.position = team.css("span.value").text
      new_team.name = team.css("td.team span.long").text
      new_team.points = team.css("td.points").text
      new_team.games_played = team.css("td")[3].text
      new_team.games_won = team.css("td")[4].text
      new_team.games_drawn = team.css("td")[5].text
      new_team.games_lost = team.css("td")[6].text
      new_team.goals_for = team.css("td")[7].text
      new_team.goals_against = team.css("td")[8].text
      new_team.goal_differential = team.css("td")[9].text.strip
      self.all << new_team
      new_team
    end
  end
end
