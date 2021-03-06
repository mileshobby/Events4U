class CreateEventCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :event_categories do |t|
      t.integer :category_id, null: false
      t.integer :event_id, null: false
      t.timestamps
    end
    add_index :event_categories, [:event_id, :category_id], unique: true
  end
end
