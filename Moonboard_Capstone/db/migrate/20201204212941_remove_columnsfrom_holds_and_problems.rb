class RemoveColumnsfromHoldsAndProblems < ActiveRecord::Migration[6.0]
  def change
    remove_column :problems, :name
    remove_column :holds, :hold_set
    remove_column :problems, :hold_set
    add_column :problems, :name_id, :integer
    add_column :holds, :hold_set_id, :integer
    add_column :problems, :hold_set_id, :integer
  end
end
