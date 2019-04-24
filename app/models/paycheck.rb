class Paycheck < ApplicationRecord
    belongs_to :worker
    belongs_to :salaries
end
