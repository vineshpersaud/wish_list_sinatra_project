source 'http://rubygems.org'

gem 'sinatra'
gem 'ruby '2.3.7''
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'bcrypt'
gem 'rack-flash3'
gem 'thin'

group :development do
 gem 'sqlite3'
 gem "tux"
 gem 'pry'
 gem 'shotgun'
 
end

group :production do
 gem 'pg', '~> 1.0.0'
end


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
