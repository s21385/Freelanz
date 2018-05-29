class Message < ApplicationRecord
  belongs_to :discussion
  validates :message, presence: :true
end
