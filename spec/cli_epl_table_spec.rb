require "cli_epl_table/scraper"

RSpec.describe CliEplTable do
  it "has a version number" do
    expect(CliEplTable::VERSION).to_not be nil
  end
end

RSpec.describe CliEplTable::Scraper do
  it "gets html from premierleague.com/tables" do
    expect(CliEplTable::Scraper.scrape_site.text).to include("Premier League", "Manchester City")
  end
end

RSpec.describe CliEplTable::Teams do
  it "list is not empty" do
    expect(CliEplTable::Teams.list).to_not be([])
  end

  it "list returns twenty teams" do
    expect(CliEplTable::Teams.list.size).to eq(20)
  end

  describe "teams have the correct attributes" do
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:name) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:position) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:games_played) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:games_won) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:games_drawn) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:games_lost) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:goals_for) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:goals_against) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:goal_differential) }
    it { expect(CliEplTable::Teams.list[0]).to respond_to(:points) }
  end
end
