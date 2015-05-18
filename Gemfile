source 'https://rubygems.org'

ruby '2.2.2'

# Rails Dependencies
gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

# MHW Dependencies
gem 'devise'
gem 'bootstrap-sass'
gem 'puma'
gem 'aws-sdk', '~> 1.6'
gem 'paperclip'
gem 'figaro'
gem 'delayed_job_active_record'

# Environment Dependencies
group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'coveralls', require: false
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'shoulda'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
