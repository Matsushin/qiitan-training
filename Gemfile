source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.3'
gem 'mysql2', '~> 0.4.10'
gem 'puma', '3.12.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', require: false
gem 'foreman'
gem 'hamlit-rails'
gem 'simple_form'
gem 'ransack'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'active_interaction'
gem 'kaminari'
gem 'enumerize'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'cocoon', path: File.join(File.dirname(__FILE__), '/vendor/gems/cocoon-1.2.11')

# Assets
gem 'webpacker', '3.5.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'erb2haml'
  gem 'bullet'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

# group :production do
#   gem 'unicorn'
# end