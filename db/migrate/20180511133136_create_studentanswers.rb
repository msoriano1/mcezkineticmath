class CreateStudentanswers < ActiveRecord::Migration
  def change
    create_table :studentanswers do |t|
      t.string :studentinput
      
      t.references :topic, foreign_key: true
      t.references :yearlevel, foreign_key: true
      t.references :worksheet, foreign_key: true
      t.references :student, foreign_key: true
      t.references :answered_worksheet, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
