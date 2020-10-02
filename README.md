# RailsAdminContentBuilderRails6

Easy way for create contents using [rails_admin](https://github.com/sferik/rails_admin).
This gem is an update of [rails_admin_content_builder](https://github.com/luizpicolo/rails_admin_content_builder), it has bugfixes, improvements and now works on Rails 6.


## Preview

![content-min](https://cloud.githubusercontent.com/assets/2979365/20011834/b0c61e4a-a28b-11e6-955c-cc487f43a880.jpg)

## Requirements

Dependencies

    MiniMagick

Supported ORM

    ActiveRecord

Supported Asset Plugin

    CarrierWave

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_admin'
gem 'rails_admin_content_builder_rails_6'
```

Run the generator and migrations

    rails g rails_admin_content_builder
    rake db:migrate

Add styles in app/assets/application.scss

```ruby
*= require rails_admin_content_builder
```

Now you can remove the `Related Content Snippets`. Inside `config/application.rb`, just after `Bundler.require`

```ruby
ENV['RAILS_ADMIN_CONTENT_BUILDER_RELATED'] = 'false'
```

## Usage

For custom model, see: [Customizing Model](https://github.com/luizpicolo/rails_admin_content_builder/wiki/Customizing-model)

Include in your controller

```ruby
include RailsAdminContentBuilder::ContentBuilderHelpers
```

Example

```ruby
class PostsController < ApplicationController
  include RailsAdminContentBuilder::ContentBuilderHelpers

  def index
  end

  def show
  end
end
```

```ruby
# Return all objects contents
@contents = all_contents_created

# Return especific object content
@content = find_content_created_by_slug('your-slug')

# Return content
@content = find_content_created_by_slug('your-slug')
@content.content_sanitized
```

In your show content view

```html
<article>
  <h1><%= @content.title %></h1>
  <p>
    <%= @content.written_by %>
  </p>
  <p><%= @content.summary %></p>

<%= @content.content_sanitized %>
</article>
```

## Attributes and Methods

```ruby
# Attributes
"title" : String    
"written_by" : String    
"date_publish" : DateTime    
"content" : Text    
"status" : Boolean           
"slug" : String    

# Methods
content_sanitized : Text
content_builder_images : Object
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_admin_content_builder_rails_6. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsAdminContentBuilderRails6 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_admin_content_builder_rails_6/blob/master/CODE_OF_CONDUCT.md).
