class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  enum repeat: { nothing: 1, daily: 2, weekly: 3, monthly: 4, year: 5 }
  enum status: { incomplete: 0, complete: 1 }
  scope :recent, -> { order(craeted_at: desc)}

  # 検索方法分岐
  def self.search(keyword, search_method)
    @tasks = Task.all
    return @tasks unless keyword.present?
      if search_method == "perfect_match"
        @tasks = @tasks.where("title LIKE?", "#{keyword}")
      elsif search_method == "forward_match"
        @tasks = @tasks.where("title LIKE?","#{keyword}%")
      elsif search_method == "backward_match"
        @tasks = @tasks.where("title LIKE?","%#{keyword}")
      elsif search_method == "partial_match"
        @tasks = @tasks.where("title LIKE?","%#{keyword}%")
      end
    @tasks
  end
end