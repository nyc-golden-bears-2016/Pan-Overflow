class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :question_id, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
