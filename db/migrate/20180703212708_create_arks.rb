class CreateArks < ActiveRecord::Migration[5.2]
  def change
    create_table :arks do |t|
      t.string :description
      t.integer :user_id
      t.string :image
      t.string :location
      t.string :serial_num
      t.string :completed
      t.timestamps
    end
  end
end
