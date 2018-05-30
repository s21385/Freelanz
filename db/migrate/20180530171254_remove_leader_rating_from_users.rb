class RemoveLeaderRatingFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :leader_rating, :integer
    remove_column :users, :collaborator_rating, :integer
  end
end
