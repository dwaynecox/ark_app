class CreateDollars < ActiveRecord::Migration[5.2]
  def change
    create_table :dollars do |t|
      t.string :serial_num

      t.timestamps
    end
  end
end
