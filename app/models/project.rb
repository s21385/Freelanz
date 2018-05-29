class Project < ApplicationRecord
  belongs_to :user
  has_many :discussions, as: :discussionable, dependent: :destroy
  has_many :messages, through: :discussions
  has_many :positions, dependent: :destroy
  validates :name, presence: :true
  validates :short_description, presence: :true

end
