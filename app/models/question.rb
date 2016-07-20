class Question < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :votes, as: :post

  validates :subject, :body, presence: true
end
