class Position < ApplicationRecord
  include PgSearch
  multisearchable against: [ :name ]

  belongs_to :project
  has_many :user_positions, dependent: :destroy
  has_one :first_skill, dependent: :destroy
  has_one :second_skill, dependent: :destroy
  has_one :third_skill, dependent: :destroy
  validates :name, presence: :true
  validates :status, presence: :true, inclusion: { in: ["Filled", "Open"] }
  validates :skill_level, presence: :true, inclusion: { in: User::SKILL_LEVEL }

end
