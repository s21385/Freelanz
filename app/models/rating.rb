class Rating < ApplicationRecord
  belongs_to :user
  validates :rater, presence: :true
  validates :ratee_type, presence: :true, inclusion: { in: ["Project Leader", "Project Contributor"] }
  validates :rating, presence: :true, inclusion: { in: [1, 2, 3, 4, 5] }
end
