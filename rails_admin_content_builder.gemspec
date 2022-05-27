lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_admin_content_builder_rails_6/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_admin_content_builder_rails_6"
  spec.version       = RailsAdminContentBuilderRails6::VERSION
  spec.authors       = ["Giuliano Crivelli"]
  spec.email         = ["giuliano@agenciaw3.digital"]

  spec.summary       = "Easy way for create contents using rails_admin on Rails 6"
  spec.description   = "Easy way for create contents using rails_admin on Rails 6 now with improvements and bug fixes"
  spec.homepage      = "https://github.com/thefalked/rails_admin_content_builder_rails_6"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0", "< 3.0"
  spec.add_development_dependency "rake", "~> 10.0", "< 14.0"
  spec.add_development_dependency 'rails', '~> 7.0.0', '< 8'
  spec.add_development_dependency 'rails_admin', '~> 3.0.0' 
  spec.add_development_dependency 'capybara', '~> 3.37.0' # Test by simulate how a user should use your web site
  spec.add_development_dependency 'launchy', '~> 2.4', '>= 2.5.0' # Helper class for launching cross-platform applications 
  spec.add_development_dependency 'shoulda-matchers', '~> 5.1.0' # Provides RSpec- and Minitest-compatible one-liners to test common Rails functionality 
  spec.add_development_dependency 'selenium-webdriver', '~> 4.0.0' # Implements the W3C WebDriver protocol to automate popular browsers
  spec.add_development_dependency 'factory_girl_rails', '~> 4.7', '< 5.0.0' # provides integration between factory_girl and rails 3 or newer 
  spec.add_development_dependency 'faker', '~> 1.6', '< 3.0.0' # A port of Data::Faker from Perl, is used to easily generate fake data

  spec.add_runtime_dependency 'carrierwave', '~> 2.2.2', "< 3.0.0"
  spec.add_runtime_dependency 'medium-editor-rails', '~> 2.1', '< 2.5.0' # Is not maintained anymore(last version 2.3.3)
  spec.add_runtime_dependency 'mini_magick', '~> 4.11.0'
  spec.add_runtime_dependency 'friendly_id', '~> 5.1', '>= 5.1.0' # If it doesn't work set 5.4.0
  spec.add_runtime_dependency 'simple_form', '~> 5.1.0'
  spec.add_runtime_dependency 'search_cop', '~> 1.2.0' # Search engine like fulltext query support for ActiveRecord
  spec.add_runtime_dependency 'rails-html-sanitizer', '~> 1.4.2'
end
