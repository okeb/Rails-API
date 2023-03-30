class Idea < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 50 }
end

