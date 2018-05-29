class Discussion < ApplicationRecord
  belongs_to :discussionable, polymorphic: true
  has_many :messages
  validates :short_description, presence: :true
end
