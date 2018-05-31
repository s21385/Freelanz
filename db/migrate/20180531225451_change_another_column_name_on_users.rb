class ChangeAnotherColumnNameOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :github_account, :github_id
  end
end
