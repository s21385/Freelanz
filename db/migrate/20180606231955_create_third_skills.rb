class CreateThirdSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :third_skills do |t|
      t.references :skill, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
