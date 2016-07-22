class Question < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers

  validates :subject, :body, presence: true
  validates :subject, uniqueness: { scope: [:body, :user_id]}
  validates :body, format: {with: /(honey)| (graham)|(back to code)|(pan)/i, message: "must contain 'Honey', 'Graham', 'Back to Code', or 'Pan'"}

  def points
    votes.sum(:value)
  end

end
