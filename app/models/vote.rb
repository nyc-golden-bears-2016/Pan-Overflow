class Vote < ActiveRecord::Base
  belongs_to :post, polymorphic: true

  validates :value, presence: true
end
