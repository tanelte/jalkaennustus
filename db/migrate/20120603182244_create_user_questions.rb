class CreateUserQuestions < ActiveRecord::Migration
  def up
    create_table :user_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :answer
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :user_questions
  end
end
