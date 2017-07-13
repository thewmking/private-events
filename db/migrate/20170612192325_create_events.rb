class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.integer :creator_id

      t.timestamps
    end
    add_foreign_key :events, :users, column: :creator_id
    add_index :events, :creator_id
  end
end
