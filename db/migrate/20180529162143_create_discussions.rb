class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.references :discussionable, polymorphic: true
      t.string :short_description

      t.timestamps
    end
  end
end
