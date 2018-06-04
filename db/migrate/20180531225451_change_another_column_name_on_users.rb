# changed column name in users table from
# github_account to github_id


class ChangeAnotherColumnNameOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :github_account, :github_id
  end
end
