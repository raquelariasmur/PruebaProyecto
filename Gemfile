source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"

gem "bootsnap", require: false
gem "bootstrap", "~> 4.1.3"
gem "font-awesome-sass", "~> 4.4.0"
gem "haml"
gem "image_processing", ">= 1.2"
gem "importmap-rails"
gem "jquery-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "redis"
gem "sass-rails", "~> 5.0"
gem "sidekiq"
gem "sprockets-rails"
gem "stimulus-rails"
gem "timers"
gem "turbo-rails"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "bcrypt"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
end

group :development do
  gem "erb2haml"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end


gem "jsonapi-serializer", "~> 2.2"
