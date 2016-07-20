class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :post

  validates :text, presence: true
end