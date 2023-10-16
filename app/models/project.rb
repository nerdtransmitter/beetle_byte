class Project < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by', optional: true
  belongs_to :lead_dev, class_name: 'User', foreign_key: 'lead_dev_id', optional: true

  validates :title, presence: true
  validates :description, presence: true
  # Setting updated_by done in controller
  # before_save :set_updated_by

  # def set_updated_by
  #   # Check if any attributes have changed, which includes the `updated_at` timestamp
  #   if self.changed?
  #     self.updated_by = current_user
  #   end
  # end
end
