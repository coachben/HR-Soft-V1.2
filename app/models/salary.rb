class Salary < ApplicationRecord

  belongs_to :worker
  
  validates :worker_id, :allowance, :bank_acc_no, :bank_acc_type, :bank_address, :income_tax,
                :income_tax_no, :salary, :pay_type, presence: true
                
#  validates  :allowance, :income_tax_no, :salary, :income_tax, numericality: {:salary, :greater_than_or_equal_to => 0}

#  validate :no_salaries_outside_employment_dates, if: :worker
#  delegate :first_name, :last_name, to: :worker, prefix: true
#
#  default_scope { order('start_date') }
#
#  def self.ordered_dates
#    select('distinct start_date').order('start_date').map(&:start_date)
#  end
#
#  def self.ordered_dates_with_previous_dates
#    ordered_dates.map { |date| [date - 1, date] }.flatten
#  end
#
#  def self.all_dates
#    (Salary.history_dates << Time.zone.today).sort.uniq
#  end
#
#  def self.history_dates
#    (Salary.ordered_dates_with_previous_dates + Employee.ordered_start_dates).sort.uniq
#  end
#
#  private
#
#  def no_salaries_outside_employment_dates
#    unless employee.employed_on?(start_date)
#      errors.add(:start_date, 'must be between employee start and end dates')
#    end
#    
#  end
    
end
