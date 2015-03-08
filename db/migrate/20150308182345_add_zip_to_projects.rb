class AddZipToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :zip, :string
  end
end
