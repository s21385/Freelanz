class AddCompanyNameToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :company_name, :string
  end
end
