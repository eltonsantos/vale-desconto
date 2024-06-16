class AddObjectChangesToVersions < ActiveRecord::Migration[7.1]
  def change
    add_column :versions, :object_changes, :jsonb
  end
end
