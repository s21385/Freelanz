class Group < ApplicationRecord
  has_many :discussions, as: :discussionable, dependent: :destroy
  has_many :group_memberships, dependent: :destroy
  has_many :messages, through: :discussions
  validates :name, presence: :true
  validates :description, presence: :true
end
