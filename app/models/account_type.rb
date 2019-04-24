class AccountType < ApplicationRecord

validates :name, presence: true, uniqueness: true
  TYPES = ['Salary',
           'Wages',
           'Others'].freeze

  def self.seed
    TYPES.each do |name|
      AccountType.find_or_create_by name: name
    end
  end

end
