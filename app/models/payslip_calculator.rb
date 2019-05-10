class PayslipCalculator < ApplicationRecord

    attr_accessor :starting_salary, :pay_rate, :pay_period_start_date, :pay_period_end_date, :monthly_tax
    attr_reader :start_date, :end_date, :incomplete_month
    
    def initialize(attributes={})
        super
        @start_date       = @pay_period_start_date.to_date
        @end_date         = @pay_pediod_end_date.to_date
        @incomplete_month = incomplete_month_calculation
    end

    def gross_income
        #note this is monthly salary
        ((starting_salary.to_f) * @incomplete_month.round(0)).to_i
    end
    
    def income_tax
        ((@monthly_tax.to_f) * @incomplete_month.round(0)).to_i
    end
    
    def net_income
        (self.gross_income - self.income_tax).to_i
    end
    
    #rate based pay
    def super_amount
        (self.gross_income * @pay_rate).round(0).to_i
    end
    
    private
    
    def incomplete_month_calculation
        if fist_date_of_month? && last_date_of_month?
            1
        else
            fraction_part_of_month
        end
    end

    def first_date_of_month?
        @start_date = @start_date.at_beginning_of_month
    end
    
    def last_date_of_month?
        @end_date == @end_date.at_end_of_month
    end
    
    def fraction_part_of_month
        work_days_in_this_month = @start_date.at_beginning_of_month.business_days_until(@start_date.at_end_of_month)
        worked_days = @start_date.business_days_until(@end_month)
        worked_days.to_f/work_days_in_this_month.to_f
    end
    
end

