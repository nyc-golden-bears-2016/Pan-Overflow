class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  has_secure_password

  validates :username, uniqueness:true, presence: true
  validates :username, format:{with: /(pan)|(honey)|(graham)/i, message: "must contain 'Pan', 'Honey', or 'Graham'"}
  validates :password, length: {in: 6..20}

end
