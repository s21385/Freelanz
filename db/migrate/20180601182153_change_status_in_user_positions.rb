class ChangeStatusInUserPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_positions, :status, :string
    add_column :user_positions, :status, :string, default: "pending"
  end
end
