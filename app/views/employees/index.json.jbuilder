json.array!(@employees) do |employee|
  json.extract! employee, :id, :firstname, :code, :nationalid
  json.url employee_url(employee, format: :json)
end
