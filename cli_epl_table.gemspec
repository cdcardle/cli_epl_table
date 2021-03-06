
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cli_epl_table/version"

Gem::Specification.new do |spec|
  spec.name          = "cli_epl_table"
  spec.version       = CliEplTable::VERSION
  spec.authors       = ["Chris Cardle"]
  spec.email         = ["cdcardle@gmail.com"]

  spec.summary       = "CLI Premier League table in your terminal!"
  spec.description   = "You can check the current English Premier League table based on the official Premier League website from your terminal.  You can also check individual teams for more of their statistics."
  spec.homepage      = "https://github.com/cdcardle/cli_epl_table"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = "epl"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12"

  spec.add_dependency "nokogiri", "~> 1.10"
  spec.add_dependency "colorize", "~> 0.8"
  spec.add_dependency "certified", "~> 1"
end
