class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.integer :age
      t.string :sex

      t.timestamps
    end
  end
end
