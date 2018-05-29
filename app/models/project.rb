class Project < ApplicationRecord
  belongs_to :user
  has_many :discussions, as: :discussionable
  has_many :positions
  validates :name, presence: :true
  validates :short_description, presence: :true

end
