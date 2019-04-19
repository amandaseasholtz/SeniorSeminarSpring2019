class PostTravel < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :payment, optional: true

  has_one :employee
  has_one :payment
end
