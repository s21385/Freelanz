class UserPosition < ApplicationRecord
  belongs_to :user
  belongs_to :position
  validates :rate_cents, presence: :true, numericality: { only_integer: true }
  validates :status, presence: :true, inclusion: { in: ["Approved", "Denied", "Pending"] }
end
