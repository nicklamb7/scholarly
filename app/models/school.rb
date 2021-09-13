class School < ApplicationRecord
  has_many :destinations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :scholarships, dependent: :destroy
  has_one_attached :thumbnail
  has_one_attached :logo
  has_one_attached :cover
  has_many_attached :photos, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_school_type,
    against: [ :name, :school_type ],
    using: {
      tsearch: { prefix: true }
  }
end
