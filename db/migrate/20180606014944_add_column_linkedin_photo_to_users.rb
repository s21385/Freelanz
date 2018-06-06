class AddColumnLinkedinPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :linkedin_photo, :text
  end
end
