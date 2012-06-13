class AddDeletedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :deleted, :boolean
  end
end
