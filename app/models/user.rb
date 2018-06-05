class User < ApplicationRecord
  SKILL_LEVELS = ["Junior programmer", "Intermediate programmer", "Senior programmer"]

  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_and_belongs_to_many :ratings,
  #   class_name: "User",
  #   join_table: :ratings,
  #   foreign_key: :user_id,
  #   association_foreign_key: :rater_id

  has_many :group_memberships, dependent: :destroy
  has_many :groups, through: :group_memberships
  has_many :user_positions, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :discussions
  has_many :messages, dependent: :destroy
  has_many :positions, through: :user_positions, dependent: :destroy
  has_many :projects
  has_many :positions, through: :projects, dependent: :destroy
  has_many :user_positions, through: :positions, dependent: :destroy

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true, uniqueness: :true
  validates :linkedin_id, uniqueness: :true, allow_nil: :true
  validates :github_id, uniqueness: :true, allow_nil: :true
  validates :skill_level, allow_nil: :true, inclusion: { in: SKILL_LEVELS }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
