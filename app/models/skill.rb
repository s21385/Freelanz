class Skill < ApplicationRecord
  belongs_to :first_skill
  belongs_to :second_skill
  belongs_to :third_skill
end
