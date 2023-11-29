class Ticket < ApplicationRecord
  before_save :set_default_status, if: -> { status.nil? }

  # ENUMS
  enum status: { open: 0, in_progress: 1, in_qa: 2, ready_for_release: 3, closed: 4, reopened: 5 }
  enum priority: { critical: 0, high: 1, medium: 2, low: 3 }

  # VALIDATIONS
  validates :summary, presence: true
  validates :project, presence: true
  validates :status, inclusion: { in: statuses.keys }
  validates :priority, inclusion: { in: priorities.keys }

  # ASSOCIATIONS
  belongs_to :project
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :modified_by, class_name: 'User', foreign_key: 'modified_by_id', optional: true
  belongs_to :dev, class_name: 'User', foreign_key: 'dev_id', optional: true
  # has_many_attached :attachments

  # CALLBACKS
  # Set default status to 'Open' if none given
  def set_default_status
    self.status = 0
  end
end
