class Position < ApplicationRecord
  belongs_to :project
  has_many :user_positions, dependent: :destroy
  validates :name, presence: :true
  validates :status, presence: :true, inclusion: { in: ["Filled", "Open"] }
  validates :first_skill, presence: :true
  validates :skill_level, presence: :true, inclusion: { in: User::SKILL_LEVEL }

end
