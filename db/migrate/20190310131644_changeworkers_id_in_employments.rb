class ChangeworkersIdInEmployments < ActiveRecord::Migration[5.0]
  def change
    add_column :employments, :worker_id, :integer, index: true
    add_column :employments, :company_id, :integer, index: true
  end
end
