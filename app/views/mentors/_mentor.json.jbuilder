json.extract! mentor, :id, :first_name, :last_name, :email, :manager_name, :manager_email, :is_active, :is_approved, :skills, :created_at, :updated_at
json.url mentor_url(mentor, format: :json)
