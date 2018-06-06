class AddLinkedinProfileProfileColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :linkedin_profile_url, :text
  end
end
