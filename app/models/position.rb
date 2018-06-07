class Position < ApplicationRecord
  include PgSearch
  multisearchable against: [ :name ]

  belongs_to :project
  has_many :user_positions, dependent: :destroy

  has_many :position_skills
  has_many :skills, through: :position_skills

  validates :name, presence: :true
  validates :status, presence: :true, inclusion: { in: ["Filled", "Open"] }
  validates :skill_level, presence: :true, inclusion: { in: User::SKILL_LEVEL }

end
