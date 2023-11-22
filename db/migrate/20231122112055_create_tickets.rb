class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :project, null: false, foreign_key: true
      t.string :status
      t.integer :priority
      t.string :summary
      t.text :details
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.references :modified_by, foreign_key: { to_table: :users }
      t.references :dev, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
