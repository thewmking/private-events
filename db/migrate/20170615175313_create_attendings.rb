class CreateAttendings < ActiveRecord::Migration[5.0]
  def change
    create_table :attendings do |t|
      t.references :event,    foreign_key: true
      t.integer :attendee_id

      t.timestamps
    end
    add_foreign_key :attendings, :users, column: :attendee_id
    add_index       :attendings, :attendee_id
  end
end
