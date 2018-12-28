class User < ActiveRecord::Base
  has_many :goals
  has_many :steps, through: :goals
  has_many :favorites
  has_secure_password


  def slug
    self.username.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    User.all.select {|user| user.slug == slug}.first
  end

end
