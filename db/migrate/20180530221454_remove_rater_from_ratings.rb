class RemoveRaterFromRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratings, :rater, :integer
  end
end
