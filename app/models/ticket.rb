class Ticket < ApplicationRecord
  before_save :set_default_status, if: -> { status.nil? }

  belongs_to :project
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :modified_by, class_name: 'User', foreign_key: 'modified_by_id', optional: true
  belongs_to :dev, class_name: 'User', foreign_key: 'dev_id', optional: true

  validates :summary, presence: true

  validates :status, inclusion: { in: ['Open', 'In Progress', 'Pending', 'Closed', 'Rejected', 'Reopened'] }
  validates :priority, inclusion: { in: [nil, 1, 2, 3, 4] }
  # Mapping integer values to priority names
  enum priority: { unassigned: nil, critical: 1, high: 2, medium: 3, low: 4 }

  # Set default status to 'Open' if none given
  def set_default_status
    self.status = 'Open'
  end
end
