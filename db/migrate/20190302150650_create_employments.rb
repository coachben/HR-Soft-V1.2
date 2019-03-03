class CreateEmployments < ActiveRecord::Migration[5.0]
  def change
    create_table :employments do |t|
      t.belongs_to :employee, index: true
      t.timestamps
    end
  end
end
