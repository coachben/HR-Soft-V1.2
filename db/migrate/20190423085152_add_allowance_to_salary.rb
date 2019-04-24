class AddAllowanceToSalary < ActiveRecord::Migration[5.0]
  def change
      add_column :salaries, :allowance, :decimal,  precision: 10, scale: 2
      add_column :salaries, :income_tax,  :decimal,  precision: 10, scale: 2
      add_column :salaries, :bank_name, :string
      add_column :salaries, :bank_acc_type, :string
      add_column :salaries, :bank_address, :string
      add_column :salaries, :income_tax_no, :string
      add_column :salaries, :nhif, :decimal
      add_column :salaries, :nhif_no, :string
      add_column :salaries, :nssf, :decimal
      add_column :salaries, :nssf_no, :string
      add_column :salaries, :pay_type, :integer
      add_column :salaries, :salary, :decimal,  precision: 10, scale: 2
      add_column :salaries, :net_salary, :decimal,  precision: 10, scale: 2
  end
end
