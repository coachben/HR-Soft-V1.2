json.extract! company, :id, :name, :code, :started_on, :address, :city, :country, :created_at, :updated_at
json.url company_url(company, format: :json)
