class Ticket < ApplicationRecord
  before_save :set_default_status, if: -> { status.nil? }

  belongs_to :project
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :modified_by, class_name: 'User', foreign_key: 'modified_by_id', optional: true
  belongs_to :dev, class_name: 'User', foreign_key: 'dev_id', optional: true

  validates :summary, presence: true
  validates :project, presence: true

  # Mapping integer values to status names
  enum status: { open: 0, in_progress: 1, pending: 2, closed: 3, rejected: 4, reopened: 5 }
  validates :status, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  # Mapping integer values to priority names
  enum priority: { unassigned: nil, critical: 1, high: 2, medium: 3, low: 4 }
  validates :priority, inclusion: { in: [nil, 1, 2, 3, 4] }

  # Set default status to 'Open' if none given
  def set_default_status
    self.status = 'Open'
  end
end
