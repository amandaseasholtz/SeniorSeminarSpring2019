class ExpectedCost < ApplicationRecord
  belongs_to :requests, optional: true
end
