class Project < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  include PgSearch
  multisearchable against: [ :name ]

  belongs_to :user
  has_many :discussions, as: :discussionable, dependent: :destroy
  has_many :messages, through: :discussions
  has_many :positions, dependent: :destroy
  has_many :user_positions, through: :positions

  validates :name, presence: :true
  validates :short_description, presence: :true
  validates :status, presence: :true, inclusion: { in: ["Started", "Completed"] }

  before_validation :set_status

  include PgSearch
  pg_search_scope :global_search,
    against: [ :company_name, :description ],
    associated_against: {
      positions: [ :name, :skill_level ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def set_status
    self.status = "Started" if self.status.nil?
  end

  def first_three_skills
    Skill.joins(position_skills: {position: :project}).where(projects: {id: self.id}).uniq(&:photo).first(3)
  end
end
