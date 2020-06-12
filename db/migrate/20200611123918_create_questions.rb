class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.string :type
      t.string :choices, null: false, array: true, default: []
      t.string :correct_answer, null: false
      

      t.timestamps
    end
  end
end
