class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :user
      t.string :friends
      
      t.timestamps
    end
  end
end
