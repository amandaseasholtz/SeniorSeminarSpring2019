class PaymentInformation < ApplicationRecord
  belongs_to :requests, optional: true
end
