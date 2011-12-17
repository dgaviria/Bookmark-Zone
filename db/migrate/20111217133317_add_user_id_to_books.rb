class AddUserIdToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :user_id, :integer
    add_index :books, [:user_id, :created_at]
  end

  def self.down
    remove_index :books, :user_id
    remove_column :books, :user_id
  end
end
