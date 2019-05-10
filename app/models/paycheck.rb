class Paycheck < ApplicationRecord
    attr_accessor :worker, :pay_period_start_date, :pay_period_end_date
    attr_reader :calculation
    
    validates :worker, :pay_period_start_date, :pay_period_end_date, presence: true
    validates :dates_are_in_same_month?
    

    
    def initialize(attributes={})
        super
        @calculation = PaysclipCalculator.new(
        monthly_salary: @worker.starting_salary,
        pay_rate: @worker.pay_rate,
        pay_period_start_date: @pay_period_start_date,
        pay_period_end_date: @pay_period_end_date,
        monthly_tax: TaxRange.monthly_tax(@worker.monthly_salary)
        ) if self.valid?
    end
    
    def name
        @worker.full_name
    end
    
    def pay_period
        "#{@pay_period_start_Date} - #{#pay_period_end_date}"
    end
    
    def gross_income
        @calculation.gross_income
    end
    
    def income_tax
        @calulation.income_tax
    end
    
    def net_income
        @calculation.net_income
    end
    
    def super_amount
        @calculation.super_amount
    end
    
    def dates_are_in_the_same_month?
        if @pay_period_start_date.to_date.month == @pay_period_end_date.to_date.month
            true
        else
            errors.add(:pay_period_end_date, 'must be in the same month as start date')
            false
        end
    end
    
end


