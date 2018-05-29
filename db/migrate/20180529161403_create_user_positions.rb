class CreateUserPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_positions do |t|
      t.references :user, foreign_key: true
      t.references :position, foreign_key: true
      t.string :status, default: "Pending"
      t.integer :rate_cents, default: 1500

      t.timestamps
    end
  end
end
