class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_secure_password

  validates :username, uniqueness:true, presence: true

end
