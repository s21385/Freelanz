class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.integer :rate_cents
      t.string :status
      t.string :first_skill
      t.string :second_skill
      t.string :third_skill
      t.integer :skill_level

      t.timestamps
    end
  end
end
