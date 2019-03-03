class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.belongs_to :company, index: true
      t.timestamps
    end
  end
end
