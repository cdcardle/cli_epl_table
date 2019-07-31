class CliEplTable::Team
  attr_accessor :position, :name, :points, :games_played, :games_won, :games_drawn, :games_lost, :goals_for, :goals_against, :goal_differential
  @@all = []

  # define all
  def self.all
    @@all
  end

  # init all teams with corresponding attributes from the scraped data
  def initialize(data)
    @position = data.css("span.value").text
    @name = data.css("td.team span.long").text
    @points = data.css("td.points").text
    @games_played = data.css("td")[3].text
    @games_won = data.css("td")[4].text
    @games_drawn = data.css("td")[5].text
    @games_lost = data.css("td")[6].text
    @goals_for = data.css("td")[7].text
    @goals_against = data.css("td")[8].text
    @goal_differential = data.css("td")[9].text.strip
    @@all << self
  end
end