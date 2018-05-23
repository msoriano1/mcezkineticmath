class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.string :title
      t.string :directions
      t.references :topic, foreign_key: true
      t.references :yearlevel, foreign_key: true
      t.references :admin, foreign_key: true
      t.references :teacher, foreign_key: true
      
      t.timestamps null: false
    end
    
  end
end
