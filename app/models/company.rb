class Company < ApplicationRecord
    has_many :workers, dependent: :destroy
    has_many :employments, through: :workers
    has_many :paychecks, through: :workers
    has_many :departments
    
    accepts_nested_attributes_for :workers, reject_if: lambda {|attributes| attributes[‘code’].blank?},
                                allow_destroy: true

end
