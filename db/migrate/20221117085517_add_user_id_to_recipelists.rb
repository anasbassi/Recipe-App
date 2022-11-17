class AddUserIdToRecipelists < ActiveRecord::Migration[7.0]
  def change
    add_column :recipelists, :user_id, :integer
    add_index :recipelists, :user_id
  end
end
