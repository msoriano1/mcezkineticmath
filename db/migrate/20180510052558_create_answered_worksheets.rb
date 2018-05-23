class CreateAnsweredWorksheets < ActiveRecord::Migration
  def change
    create_table :answered_worksheets do |t|
      t.integer :correctanswer
      t.integer :hps
      t.datetime :dateanswered
      
      t.references :topic, foreign_key: true
      t.references :yearlevel, foreign_key: true
      t.references :worksheet, foreign_key: true
      t.references :student, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
