class AddUserIdToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :user_id, :integer
    add_index :styles, :user_id
  end
end
