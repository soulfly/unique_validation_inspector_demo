class AddLoginUniqIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, column: :login
    add_index :users, [:login], unique: true
  end
end
