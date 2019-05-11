class TaxRange < ApplicationRecord
    
    class << self
    
    def valid_tax_range(monthly_salary)
        if monthly_salary > 0
            TaxRange.where('income_min <= ? AND ? <= income_max', monthly_salary, monthly_salary).first
        else
            nil
        end
    end
    
    def monthly_tax(monthly_salary)
        #validate tax rate
        if monthly_salary > 0
            vtr = self.valid_tax_rate(monthly_salary)
            (vtr.tax_from_lower_range + ((monthly_salary - (vtr.income_min-1))*vtr.rate)).round(3)
        else
            nil
        end
    end

end
end