class AddColsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :teacher, :boolean, null: false, default: false
    add_column :users, :experience, :text
    add_column :users, :expertise, :string
    add_column :users, :eager_to_learn, :text
  end
end
