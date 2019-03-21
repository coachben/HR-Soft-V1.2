class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      #t.belongs_to :company, index: true, foreign_key: true
      t.string :firstname
      t.string :firstname
      t.string :code
      t.string :nationalid
 
      t.timestamps
    end
  end
end
