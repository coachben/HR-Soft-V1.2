class Worker < ApplicationRecord
    belongs_to :company, optional: true
    has_many :employments
    has_many :salaries
    
    def self.import(file)
        #process CSV
        CSV.foreach(file.path, headers:true) do |row|
            Worker.create! row.to_hash
        end
    end
    
end
