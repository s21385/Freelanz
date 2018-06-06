class Project < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :discussions, as: :discussionable, dependent: :destroy
  has_many :messages, through: :discussions
  has_many :positions, dependent: :destroy
  has_many :user_positions, through: :positions

  validates :name, presence: :true
  validates :short_description, presence: :true
  validates :status, presence: :true, inclusion: { in: ["Started", "Completed"] }

  before_validation :set_status

  def set_status
    self.status = "Started" if self.status.nil?
  end
end
