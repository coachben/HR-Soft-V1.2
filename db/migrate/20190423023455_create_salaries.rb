class CreateSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :salaries do |t|
      t.date :start_date
      t.date :end_date
      t.references :worker
      t.decimal :annual_amount
      t.timestamps
    end
  end
end
