class ChangeColumnNameOnGroupMembership < ActiveRecord::Migration[5.2]
  def change
    rename_column :group_memberships, :type, :category
  end
end
