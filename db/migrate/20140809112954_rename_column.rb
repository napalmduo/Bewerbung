class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :texts, :projekt_id, :project_id
  end
end
