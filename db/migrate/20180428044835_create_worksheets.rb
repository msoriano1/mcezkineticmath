class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.string :title
      t.string :directions
      t.references :topic, index: true
      t.references :yearlevel, index: true
      t.references :admin, index: true
      t.references :teacher, index: true
      
      t.timestamps null: false
    end

    add_foreign_key :worksheets, :topics, column: :topic_id 
    add_foreign_key :worksheets, :yearlevels, column: :yearlevel_id 
    add_foreign_key :worksheets, :admins, column: :admin_id 
    add_foreign_key :worksheets, :teachers, column: :teacher_id 
    
  end
end
