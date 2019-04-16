require "administrate/base_dashboard"

class RequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    employee: Field::BelongsTo,
    budget: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    destination: Field::String,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    reasoning: Field::String,
    employ_department: Field::String,
    budget_name: Field::String,
    budget_department: Field::String,
    purpose: Field::String,
    expected_expenses: Field::String,
    payment_information: Field::String,
    status: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :employee,
    :budget,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :employee,
    :budget,
    :id,
    :name,
    :destination,
    :start_date,
    :end_date,
    :reasoning,
    :employ_department,
    :budget_name,
    :budget_department,
    :purpose,
    :expected_expenses,
    :payment_information,
    :status,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :employee,
    :budget,
    :name,
    :destination,
    :start_date,
    :end_date,
    :reasoning,
    :employ_department,
    :budget_name,
    :budget_department,
    :purpose,
    :expected_expenses,
    :payment_information,
    :status,
  ].freeze

  # Overwrite this method to customize how requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(request)
  #   "Request ##{request.id}"
  # end
end
