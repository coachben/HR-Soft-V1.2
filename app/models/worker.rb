class Worker < ApplicationRecord
    belongs_to :company, optional: true
    has_many :employments
    has_many :salaries
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :starting_salary, presence: true. numeriality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :pay_rate, presence: true, numericality: {greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0}
    
    def full_name
        "#{first_name}, #{last_name}"
    end
    
    def self.import(file)
        #process CSV import for workers
        CSV.foreach(file.path, headers:true) do |row|
            Worker.create! row.to_hash
        end
    end
    
    def convert_rate_pct_to_dec
        self.pay_rate = self.pay_rate.to_f/100 if percentage?
    end
    
    def percentage?
    # returns a true or false
        (self.pay_rate.to_s.include?('%')) or (self.pay_rate.to_f > 1.0)
    end
    
    
end
