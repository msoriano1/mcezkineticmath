class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :worksheet, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :yearlevel, index: true, foreign_key: true
      t.integer :number
      t.string :question
      t.string :answer

      t.timestamps null: false
    end
  end
end
