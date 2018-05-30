class AddRaterToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :rater_id, :integer
  end
end
