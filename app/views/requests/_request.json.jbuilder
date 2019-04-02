json.extract! request, :id, : name, :destination, :requested_travel_days, :purpose, :expected_expenses, :payment_information, :created_at, :updated_at
json.url request_url(request, format: :json)
