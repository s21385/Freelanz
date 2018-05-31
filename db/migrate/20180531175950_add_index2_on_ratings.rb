class AddIndex2OnRatings < ActiveRecord::Migration[5.2]
  def change
    add_index(:ratings, [ :rater_id, :user_id ])
    remove_index :ratings, :user_id
  end
end
