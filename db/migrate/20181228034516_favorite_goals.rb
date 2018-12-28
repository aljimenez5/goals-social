class FavoriteGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_goals do |t|
      t.integer :user_id
      t.integer :goal_id
      t.integer :favored_by
    end
  end

end
