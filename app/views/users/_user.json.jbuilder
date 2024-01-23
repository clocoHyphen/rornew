json.extract! user, :id, :fname, :lname, :email, :userId, :gender, :dob , :address, :created_at, :updated_at, :password
json.url user_url(user, format: :json)
