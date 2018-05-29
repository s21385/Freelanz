class Position < ApplicationRecord
  belongs_to :project
  has_many :user_positions, dependent: :destroy
  validates :name, presence: :true
  validates :rate_cents, presence: :true, numericality: { only_integer: true }
  validates :status, presence: :true
  validates :first_skill, presence: :true
  validates :skill_level, presence: :true, inclusion: { in: ["Junior programmer", "Senior programmer", "Programmer"] }

end
