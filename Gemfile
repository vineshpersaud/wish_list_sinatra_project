source 'http://rubygems.org'
ruby '2.4.1'

gem "sinatra"
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'rack-flash3'


group :production do
    gem 'pg', '~> 0.11'
end

group :development do
  gem 'sqlite3'
  gem 'shotgun'
  gem 'pry'
  gem "tux"
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end