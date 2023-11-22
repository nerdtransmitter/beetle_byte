class AddDueDateToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :due_date, :datetime
  end
end
