class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :rateable, polymorphic: true
end
