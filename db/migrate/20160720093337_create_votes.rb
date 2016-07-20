class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :post_id
      t.string :post_type

      t.timestamps
    end
  end
end
