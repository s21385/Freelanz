class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :short_description
      t.date :deadline
      t.date :start_date

      t.timestamps
    end
  end
end
