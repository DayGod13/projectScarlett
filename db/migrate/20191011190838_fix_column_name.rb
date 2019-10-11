class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :user, :user_id
  end
end
