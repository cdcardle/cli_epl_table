require "cli_epl_table/scraper"

RSpec.describe CliEplTable do
  it "has a version number" do
    expect(CliEplTable::VERSION).not_to be nil
  end
end

RSpec.describe CliEplTable::Scraper do
  it "scrapes team data from premierleague.com/tables" do
    allow(Nokogiri::HTML::Document).to \
    receive(:parse).with(open("https://www.premierleague.com/tables").body, \
    nil, nil, Nokogiri::XML::ParseOptions::DEFAULT_HTML\
    ).and_return(your_fakeresponse_body)
  end
end