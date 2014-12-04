source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.1.8'
gem 'rails-i18n', '4.0.3'
gem 'rails_autolink', '1.1.6'

gem 'pg', '0.17.1'
gem 'bcrypt', '3.1.9'
gem 'kaminari', '0.16.1'
gem 'simple_form', '3.1.0'
gem 'devise', github: 'plataformatec/devise'
gem 'devise-i18n', '0.11.2'
gem 'cancancan', '1.9.2'
gem 'enumerize', '0.8.0'
gem 'cocoon', '1.2.6'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick', '4.0.1'
gem 'quiet_assets', '1.0.3'

# Frontend stuff
gem 'jquery-rails', '3.1.2'
gem 'coffee-rails', '4.1.0'
gem 'bootstrap-sass', '3.3.1.0'
gem 'sass-rails', '4.0.5'
gem 'autoprefixer-rails', '4.0.1.1'
gem 'uglifier', '2.5.3'
gem 'bxslider-rails', '4.1.0'

gem 'activeadmin', github: 'activeadmin'

gem 'rubyzip', '1.1.6', require: false
gem 'progress_bar', '1.0.3', require: false

gem 'slim-rails', '2.1.5'

group :development, :test do
  gem 'byebug', '3.5.1' unless ENV['CI']
  gem 'rspec-rails', '3.1.0'
  gem 'factory_girl_rails', '4.5.0'
  gem 'ffaker', '1.25.0'
  gem 'rubocop', '0.27.1'
end

group :development do
  gem 'spring-commands-rspec', '1.0.2'
  gem 'spring', '1.2.0'
  gem 'guard-rubocop', '1.2.0', require: false
  gem 'guard-rspec', '4.3.1', require: false
  gem 'guard-livereload', '2.4.0', require: false
  gem 'letter_opener', '1.2.0'
  gem 'capistrano-rails', '1.1.2'
  gem 'capistrano-rvm', '0.1.2'
  gem 'unicorn-rails', '2.2.0'
end

group :test do
  gem 'capybara', '2.4.4'
  gem 'database_cleaner', '1.3.0'
  gem 'capybara-webkit', '1.3.1'
  gem 'launchy', '2.4.3'
  gem 'rb-inotify', '0.9.5'
  gem 'libnotify', '0.8.4'
  gem 'webmock', '1.20.4'
  gem 'simplecov', '0.9.1', require: false
end
