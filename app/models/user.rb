class User < ActiveRecord::Base
  has_many :goals
  has_many :steps, through: :goals
  has_secure_password

end
