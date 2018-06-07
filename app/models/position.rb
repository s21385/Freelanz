class Position < ApplicationRecord
  include PgSearch
  multisearchable against: [ :name ]

  belongs_to :project
  has_many :user_positions, dependent: :destroy
  has_many :skills, through: :first_skill, dependent: :destroy
  has_many :skills, through: :second_skill, dependent: :destroy
  has_many :skills, through: :third_skill, dependent: :destroy
  validates :name, presence: :true
  validates :status, presence: :true, inclusion: { in: ["Filled", "Open"] }
  validates :first_skill, presence: :true
  validates :skill_level, presence: :true, inclusion: { in: User::SKILL_LEVEL }

end
