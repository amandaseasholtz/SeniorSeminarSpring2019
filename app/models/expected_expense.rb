class ExpectedExpense < ApplicationRecord
  belongs_to :requests, optional: true
end
