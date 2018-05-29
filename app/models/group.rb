class Group < ApplicationRecord
  has_many :discussions, as: :discussionable
  has_many :group_memberships
  validates :name, presence: :true
  validates :description, presence: :true
end
