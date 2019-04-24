class AddStartingSalaryToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :starting_salary, :decimal, default: 0, null: false

  end
end
