source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use postgres as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'

# Makes '' to nil.
gem 'nilify_blanks'

# Bootstrap
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'popper_js'

# Icons
gem 'font-awesome-rails'

# HTML rendering
gem 'haml'

# Better errors...
gem 'better_errors'
gem 'binding_of_caller'

# memory profiling
gem 'rack-mini-profiler'

# Authentification
gem 'devise'

# Authorization
gem 'pundit'

# IP address handling.
gem 'ipaddress'

# Ajax datatables integration
gem 'ajax-datatables-rails'

# Use .env for environment variables.
gem 'dotenv-rails'

# Simpler http.
gem 'httparty'

group :development, :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  # Deployment
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'

  gem 'web-console'
  gem 'bullet'
  gem 'listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
