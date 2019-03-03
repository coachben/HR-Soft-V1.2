class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :code
      t.date :started_on
      t.string :address
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
