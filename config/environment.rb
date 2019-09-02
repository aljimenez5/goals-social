require 'active_record'
require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"



ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/goals_social_db_dev')


Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
