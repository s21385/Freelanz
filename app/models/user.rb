class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_memberships, dependent: :destroy
  has_many :groups, through: :group_memberships
  has_many :user_positions, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :discussions
  has_many :messages
  has_many :ratings
  has_many :positions, through: :user_positions


  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true, uniqueness: :true
  validates :linkedin_account, uniqueness: :true, allow_nil: :true
  validates :facebook_account, uniqueness: :true, allow_nil: :true
  validates :skill_level, presence: :true, inclusion: { in: ["Junior programmer", "Senior programmer", "Intermediate programmer"] }

end
