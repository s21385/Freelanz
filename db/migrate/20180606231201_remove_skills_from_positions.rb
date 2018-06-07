class RemoveSkillsFromPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :positions, :first_skill, :string
    remove_column :positions, :second_skill, :string
    remove_column :positions, :third_skill, :string

  end
end
