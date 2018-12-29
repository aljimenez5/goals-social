class User < ActiveRecord::Base
  has_many :goals
  has_many :steps, through: :goals
  has_many :favorite_goals
  has_many :favorites, through: :favorite_goals, source: :goal
  has_secure_password


  def slug
    self.username.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    User.all.select {|user| user.slug == slug}.first
  end

  def favorited?(goal_obj)
    self.favorites.include?(goal_obj)
  end

end
