# changed column name in users table from
# linkedin_account to linkedin_id

class ChangeColumnNameOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :linkedin_account, :linkedin_id
  end
end

