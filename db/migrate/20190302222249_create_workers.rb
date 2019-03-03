class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.belongs_to :company, index: true, foreign_key: true
      t.integer :code
      t.string :first_name
      t.string :last_name
      t.string :emp_mode
      t.string :role
      t.string :email
      t.string :reporting_manager
      t.string :job_title
      t.string :exprerience
      t.integer :tel
      t.string :status

      t.timestamps
    end
    
  end
end
