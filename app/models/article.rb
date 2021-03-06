class Article < ApplicationRecord
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 10 }
end
