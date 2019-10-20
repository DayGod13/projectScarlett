class AddIndexToComments < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, [:user_id, :profile_id]
    add_index :comments, :profile_id
  end
end
