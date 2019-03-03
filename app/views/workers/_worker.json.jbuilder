json.extract! worker, :id, :code, :first_name, :last_name, :emp_mode, :role, :email, :reporting_manager, :job_title, :exprerience, :tel, :status, :created_at, :updated_at
json.url worker_url(worker, format: :json)
