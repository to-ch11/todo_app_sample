class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  enum repeat: { nothing: 1, daily: 2, weekly: 3, monthly: 4, year: 5 }
  scope :recent, -> { order(craeted_at: desc)}
end
