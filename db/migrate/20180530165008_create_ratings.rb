class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rater
      t.integer :ratee
      t.string :ratee_type
      t.integer :rating

      t.timestamps
    end
  end
end
