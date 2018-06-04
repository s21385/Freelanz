class AddPhotoToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :photo, :string
  end
end
