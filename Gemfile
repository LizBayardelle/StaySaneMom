source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.2'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
gem 'jquery-rails'
gem 'devise'
gem 'bootsnap'
gem 'bootstrap', '~> 4.0.0'
gem 'sprockets-rails'
gem 'bootstrap-sass'
gem 'bcrypt', '~> 3.1.7'
gem 'friendly_id', '~> 5.1.0'
gem 'stripe'
gem 'figaro'
gem 'magnific-popup-rails', '~> 1.1.0'
gem 'simple_form'
gem 'acts-as-taggable-on'
gem 'aws-sdk' , '~> 3'
gem 'aws-sdk-s3', require: false
gem 'simple_form_extension'
gem 'recaptcha', require: "recaptcha/rails"
gem "font-awesome-rails"


group :production do
  gem 'pg', '~> 0.20.0'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'sqlite3'
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
