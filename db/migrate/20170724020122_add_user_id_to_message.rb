class AddUserIdToMessage < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :reciever
    add_column :messages, :user_id, :integer
  end
end
