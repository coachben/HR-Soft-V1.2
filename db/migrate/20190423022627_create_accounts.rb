class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.references :account_type
      t.timestamps
      
      
    end
  end
end




