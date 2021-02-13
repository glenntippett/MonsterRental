class Monster < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true

    include PgSearch::Model
  pg_search_scope :search_by_monster_characteristic,
    against: [ :name, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
    def avarage_rating
      if reviews.length > 0
      self.reviews.pluck(:rating).sum / reviews.length
      else
      nil
      end
    end
end
