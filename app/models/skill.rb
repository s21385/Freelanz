class Skill < ApplicationRecord
  has_many :first_skills, dependent: :destroy
  has_many :second_skills, dependent: :destroy
  has_many :third_skills, dependent: :destroy
end
