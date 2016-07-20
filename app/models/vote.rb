class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true

  validates :value, presence: true
end
