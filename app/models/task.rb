class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  scope :recent, -> { order(craeted_at: desc)}
end
