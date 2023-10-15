class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :target_date
      t.date :actual_end_date
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.references :updated_by, foreign_key: { to_table: :users }
      t.references :lead_dev, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
