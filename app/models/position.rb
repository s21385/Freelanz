class Position < ApplicationRecord
  belongs_to :project, optional: true
  has_many :user_positions, dependent: :destroy
  validates :name, presence: :true
  validates :status, presence: :true, inclusion: { in: ["Filled", "Open"] }
  validates :first_skill, presence: :true
  validates :skill_level, presence: :true, inclusion: { in: ["Junior Programmer",
    "Intermediate Programmer", "Senior Programmer"] }

end
