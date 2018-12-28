class Favorite < ActiveRecord::Base
  belongs_to :user
  has_many :goals


  def goal_obj
    Goal.find(self.goal_id)
  end

end
