lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_admin_content_builder_rails_6/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_admin_content_builder_rails_6"
  spec.version       = RailsAdminContentBuilderRails6::VERSION
  spec.authors       = ["Giuliano Crivelli"]
  spec.email         = ["giuliano@agenciaw3.digital"]

  spec.summary       = "Easy way for create contents using rails_admin on Rails 6"
  spec.description   = "Easy way for create contents using rails_admin on Rails 6"
  spec.homepage      = "https://github.com/thefalked/rails_admin_content_builder_rails_6"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rails', '~> 6.0.3', '>= 6.0.3.3'
  spec.add_development_dependency 'rails_admin', '~> 2.0.2'
  spec.add_development_dependency 'capybara', '~> 2.7', '>= 2.7.0'
  spec.add_development_dependency 'launchy', '~> 2.4', '>= 2.4.3'
  spec.add_development_dependency 'shoulda-matchers', '~> 3.1'
  spec.add_development_dependency 'selenium-webdriver', '~> 2.53', '>= 2.53.4'
  spec.add_development_dependency 'factory_girl_rails', '~> 4.7', '>= 4.7.0'
  spec.add_development_dependency 'faker', '~> 1.6', '>= 1.6.3'

  spec.add_runtime_dependency 'carrierwave', '>= 2.0'
  spec.add_runtime_dependency 'medium-editor-rails', '~> 2.1', '>= 2.1.0'
  spec.add_runtime_dependency 'mini_magick', '~> 4.5', '>= 4.5.1'
  spec.add_runtime_dependency 'friendly_id', '~> 5.1', '>= 5.1.0'
  spec.add_runtime_dependency 'simple_form', '~> 5.0.2'
  spec.add_runtime_dependency 'search_cop', '~> 1.0', '>= 1.0.6'
  spec.add_runtime_dependency 'rails-html-sanitizer', '~> 1.0', '>= 1.0.0'
end
