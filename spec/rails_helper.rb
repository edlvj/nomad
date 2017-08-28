# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
   options = {
      :js_errors => true,
      :timeout => 120,
   #   :debug => true,
      :inspector => true,
   }
   Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!

%w(support).each do |folder|
  Dir[Rails.root.join("spec/#{folder}/**/*.rb")].each do |component|
    require component
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  
  config.include GraphqlRequest, type: :request
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers

 # config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
