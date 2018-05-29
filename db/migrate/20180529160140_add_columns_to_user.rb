class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :rate_cents, :integer, default: 1500
    add_column :users, :linkedin_account, :string
    add_column :users, :facebook_account, :string
    add_column :users, :leader_rating, :integer, default: 1
    add_column :users, :collaborator_rating, :integer, default: 1
    add_column :users, :github_account, :string
    add_column :users, :skill_level, :string
  end
end
