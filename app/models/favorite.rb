class Favorite < ActiveRecord::Base
  belongs_to :user
  has_many :goals

end
