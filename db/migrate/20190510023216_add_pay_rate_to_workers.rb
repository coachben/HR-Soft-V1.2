class AddPayRateToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :pay_rate, :decimal, precision: 4, scale: 2
  end
end
