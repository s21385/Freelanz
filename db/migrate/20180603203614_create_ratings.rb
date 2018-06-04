class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.references :user, foreign_key: true
      t.integer :rateable_id
      t.string :rateable_type

      t.timestamps
    end
  end
end
