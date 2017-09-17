json.extract! user, :id, :first_name, :last_name, :phone_number, :email, :created_at, :updated_at
json.account_created true
json.attendee_created user.attendee_created?
json.subscription_created user.subscription_created?
