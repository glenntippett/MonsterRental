class Booking < ApplicationRecord
  belongs_to :user
  has_one :review
  belongs_to :monster
  validates :start_date, presence: true
  validates :end_date, presence: true
  after_validation :set_total_price

  def set_total_price
    self.total_price = (end_date - start_date).to_i * monster.price
  end
end

