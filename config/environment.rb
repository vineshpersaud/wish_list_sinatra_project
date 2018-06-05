require 'bundler/setup'
require 'rack-flash'
require './web'
Bundler.require

  ENV['SINATRA_ENV'] ||= "development"

  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/neighborhood#{ENV['SINATRA_ENV']}.sqlite"
  )


require_all 'app'