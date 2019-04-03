json.extract! post_travel, :id, :name, :destination, :start_date, :end_date, :purpose, :expected_expenses, :actual_expenses, :payment_infomation, :created_at, :updated_at
json.url post_travel_url(post_travel, format: :json)
