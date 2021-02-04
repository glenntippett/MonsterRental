class Booking < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :monsters
  validates :start_date, presence: true
  validates :end_date, presence: true
end
