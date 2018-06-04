class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :status, presence: :true, inclusion: { in: ["Pending", "Approved", "Denied"] }
  validates :category, presence: :true, inclusion: { in: ["Leader", "Member"] }

end
