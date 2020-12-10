class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.integer :hold_id
      t.string :hold_type
      t.integer :hold_set
      t.string :name
      t.integer :grade
      t.integer :user_id

      t.timestamps
    end
  end
end
