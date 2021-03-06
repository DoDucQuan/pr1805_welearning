class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :answer_content
      t.boolean :is_correct
      t.references :question, foreign_key: true

      t.timestamps
    end
    add_index :answers, [:question_id, :created_at]
  end
end
