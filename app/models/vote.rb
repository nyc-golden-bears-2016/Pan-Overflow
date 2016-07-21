class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :value, presence: true
  validates :user, uniqueness: { scope: [:votable_id, :votable_type]}
end
