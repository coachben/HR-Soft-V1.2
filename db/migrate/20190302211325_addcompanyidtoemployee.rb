class Addcompanyidtoemployee < ActiveRecord::Migration[5.0]
  def change
        add_foreign_key :employees, :companies
  end
end
