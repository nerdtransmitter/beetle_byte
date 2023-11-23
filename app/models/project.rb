class Project < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by', optional: true
  belongs_to :lead_dev, class_name: 'User', foreign_key: 'lead_dev_id', optional: true

  has_many :tickets, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
