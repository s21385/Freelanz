class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_columns(:users, :facebook_account)
  end
end
