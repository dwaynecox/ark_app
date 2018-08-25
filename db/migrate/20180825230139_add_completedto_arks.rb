class AddCompletedtoArks < ActiveRecord::Migration[5.2]
  def change
      add_column :arks, :completed, :boolean, default: false
  end
end
