class ChangeColumnStatusOnUserPosition < ActiveRecord::Migration[5.2]
  def change
    change_column :user_positions, :status, :string, default: "Open"
  end
end
