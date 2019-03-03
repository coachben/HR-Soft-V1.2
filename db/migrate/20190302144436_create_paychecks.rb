class CreatePaychecks < ActiveRecord::Migration[5.0]
  def change
    create_table :paychecks do |t|
      t.belongs_to :employee, index: true
      
      t.timestamps
    end
  end
end
