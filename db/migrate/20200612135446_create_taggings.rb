class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :category_id, null: false
      t.integer :question_id, null: false

      t.index :category_id
      t.index :question_id
      
      t.timestamps
    end
  end
end
