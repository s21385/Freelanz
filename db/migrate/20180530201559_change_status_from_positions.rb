class ChangeStatusFromPositions < ActiveRecord::Migration[5.2]
  def change
    change_column :positions, :status, :string, default: "Pending"
  end
end
