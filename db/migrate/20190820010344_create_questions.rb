class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :postulation, foreign_key: true
      t.string :body
      t.date :question_date

      t.timestamps
    end
  end
end
