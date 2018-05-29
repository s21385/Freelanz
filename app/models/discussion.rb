class Discussion < ApplicationRecord
  belongs_to :discussionable, polymorphic: true
  has_many :messages, dependent: :destroy
  validates :short_description, presence: :true
end
