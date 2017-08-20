class AddUserIdToPairings < ActiveRecord::Migration[5.1]
  def change
    add_column :pairings, :user_id, :fixnum
  end
end
