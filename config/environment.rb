require 'active_record'


ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/goals_social_db_dev')
