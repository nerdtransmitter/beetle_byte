class AddResolutionSummaryToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :resolution_summary, :text
  end
end
