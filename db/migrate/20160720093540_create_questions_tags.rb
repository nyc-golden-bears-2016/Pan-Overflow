class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_join_table :questions, :tags do |t|
      t.index :question_id
      t.index :tag_id

      t.timestamps
    end
  end
end
