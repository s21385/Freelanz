class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message
      t.references :discussion, foreign_key: true

      t.timestamps
    end
  end
end
