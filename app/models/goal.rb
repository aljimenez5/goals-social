class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite
  has_many :steps

end
