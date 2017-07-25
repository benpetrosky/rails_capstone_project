class UsernameToName < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username
    add_column :users, :name, :string
  end
end
