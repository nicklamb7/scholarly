class Scholarship < ApplicationRecord
  belongs_to :school

  validates :title, presence: true
  validates :description, presence: true
end
