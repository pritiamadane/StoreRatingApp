class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :store
  validates :score, inclusion: { in: 1..5 }
end