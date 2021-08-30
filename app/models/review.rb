class Review < ApplicationRecord
  belongs_to :school
  validates :content, length: { minimum: 10 }
end
