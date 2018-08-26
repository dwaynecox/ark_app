class ChangeCompletedtoString < ActiveRecord::Migration[5.2]
  def change
    change_column :arks, :completed, :string
  end
end
