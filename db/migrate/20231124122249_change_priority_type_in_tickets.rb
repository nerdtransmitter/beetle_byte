class ChangePriorityTypeInTickets < ActiveRecord::Migration[7.0]
  def change
    change_column :tickets, :priority, :integer, using: 'priority::integer'
  end
end
