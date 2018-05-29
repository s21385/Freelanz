class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_memberships
  has_many :user_positions
  has_many :projects

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true, uniqueness: :true
  validates :linkedin_account, uniqueness: :true
  validates :facebook_account, uniqueness: :true
  validates :skill_level, presence: :true, inclusion: { in: ["Junior programmer", "Senior programmer", "Programmer"] }

end
