class School < ApplicationRecord
  has_many :destinations
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_school_type,
    against: [ :name, :school_type ],
    using: {
      tsearch: { prefix: true }
  }
end
