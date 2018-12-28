class FavoriteGoal < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal


  def goal_obj
    Goal.find(self.goal_id)
  end

end
