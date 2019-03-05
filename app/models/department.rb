class Department < ApplicationRecord
    belongs_to :company, :inverse_of => :departments
end
