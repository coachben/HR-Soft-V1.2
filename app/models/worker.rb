class Worker < ApplicationRecord
    belongs_to :company, optional: true
    has_many :employments
    has_many :salaries
end
