class AddUserToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :user_id, :integer, null: false, foreign_key: true
  end
end
