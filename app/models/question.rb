class Question < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :subject, :body, presence: true
end
