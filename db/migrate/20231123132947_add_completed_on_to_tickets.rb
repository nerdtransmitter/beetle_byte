class AddCompletedOnToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :completed_on, :datetime
  end
end
