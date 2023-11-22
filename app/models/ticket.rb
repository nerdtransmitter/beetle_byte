class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :modified_by, class_name: 'User', foreign_key: 'modified_by_id', optional: true
  belongs_to :dev, class_name: 'User', foreign_key: 'dev_id', optional: true
end
