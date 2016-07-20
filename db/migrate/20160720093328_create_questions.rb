class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :subject
      t.string :body
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
