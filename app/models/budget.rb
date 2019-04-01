class Budget < ApplicationRecord
    has_one :account, as: :accountable
    has_many :requests
end
