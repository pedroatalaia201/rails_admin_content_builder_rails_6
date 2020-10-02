require 'medium-editor-rails'
require 'simple_form'
require 'carrierwave'
require 'friendly_id'
require 'search_cop'

module RailsAdminContentBuilderRails6
  class Engine < ::Rails::Engine
    isolate_namespace RailsAdminContentBuilderRails6

    initializer 'rails_admin_content_builder_rails_6.load_static_assets' do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/vendor"
      app.config.assets.precompile += %w(
        rails_admin/content_builder.js
        rails_admin/content_builder.css
      )
    end

    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
