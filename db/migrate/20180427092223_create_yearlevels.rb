class CreateYearlevels < ActiveRecord::Migration
  def change
    create_table :yearlevels do |t|
      t.integer :number
      t.string :description

      t.timestamps null: false
    end
  end
end
