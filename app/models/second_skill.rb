class SecondSkill < ApplicationRecord
  has_one :skill
  belongs_to :position
end
