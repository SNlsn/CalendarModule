class AddClarifyStartToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :clarify_start, :string

  end
end
