class CreateGroupMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :group_memberships do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
