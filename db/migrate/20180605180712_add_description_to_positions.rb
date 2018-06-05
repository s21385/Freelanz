class AddDescriptionToPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :description, :text
  end
end
