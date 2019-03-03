class Worker < ApplicationRecord
    belongs_to :company, optional: true
    has_many :paychecks
end
