class RemoveRateeFromRatings < ActiveRecord::Migration[5.2]
  def change
    # remove_column :ratings, :ratee, :integer
    # add_reference :ratings, :user, foreign_key: true
  end
end
