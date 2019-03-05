class Company < ApplicationRecord
    has_many :workers, dependent: :destroy
    has_many :departments, :inverse_of => :compa
    has_many :employments, through: :workers
    has_many :paychecks, through: :workers
    
    accepts_nested_attributes_for :workers, reject_if: all.blank?,
                                allow_destroy: true
    
end
