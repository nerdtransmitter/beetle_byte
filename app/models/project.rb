class Project < ApplicationRecord
  # VALIDATIONS
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  # ASSOCIATIONS
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by_id', optional: true
  belongs_to :lead_dev, class_name: 'User', foreign_key: 'lead_dev_id', optional: true
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', optional: true

  has_many :tickets, dependent: :destroy

end
