class Balance < ApplicationRecord
  COMPANY_START_DATE = '2010/01/18'.to_date

  belongs_to :account
  validates :account_id, presence: true
  validates :date, uniqueness: { scope: :account_id }
#  validate :date_not_older_than_bencro
#
#  def self.ordered_dates
#    select('distinct date').order('date').map(&:date)
#  end
#
#  private

#  def date_not_older_than_bencro
#    if date
#      errors.add(:date, 'cannot be older than company') if date < COMPANY_START_DATE
#    end
#  end
  
end
