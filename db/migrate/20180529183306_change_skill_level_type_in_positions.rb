class ChangeSkillLevelTypeInPositions < ActiveRecord::Migration[5.2]
  def change
    change_column :positions, :skill_level, :string
  end
end
