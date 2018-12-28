class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :steps
  has_many :favorite_goals
  has_many :favored_by, through: :favorite_goals, source: :user


end
