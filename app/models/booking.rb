class Booking < ApplicationRecord
  belongs_to :user
  has_one :review
  belongs_to :monster
  validates :start_date, presence: true
  validates :end_date, presence: true
end
