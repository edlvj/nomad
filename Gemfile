source 'https://rubygems.org'

ruby '2.3.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.3'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'ffaker'
gem 'cancan'
gem 'carrierwave', '~> 0.9'
gem 'fog'
gem 'fog-aws'

gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers'
gem 'devise_token_auth'
gem 'figaro'
gem 'koala'
gem 'redis-rails'
gem 'graphql', '1.7.7'
gem 'drape'

gem 'webpacker', '2.0'
gem 'foreman'
gem 'rails_admin'
gem 'omniauth'
gem 'omniauth-facebook'

gem 'materialize-sass'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'pry', require: false
  gem 'graphiql-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda', '>= 3.4.0'
  gem 'with_model'
  gem 'rails-erd', require: false
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
