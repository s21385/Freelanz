class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :status, presence: :true, inclusion: { in: ["Private", "Public", "Closed"] }
  validates :type, presence: :true, inclusion: { in: ["Leader", "Member"] }

end
