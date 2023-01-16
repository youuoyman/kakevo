class CreateFixedValues < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_values do |t|
      t.integer :fixed_id, null: false
      t.date :year_month
      t.integer :value
      t.string :description
      t.timestamps
    end
  end
end
