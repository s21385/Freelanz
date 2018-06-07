class CreatePositionSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :position_skills do |t|
      t.references :skill, foreign_key: true
      t.references :position, foreign_key: true
      t.string :skill_type

      t.timestamps
    end
  end
end

