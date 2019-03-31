class Budget < ApplicationRecord
    has_one :account, as: :accountable
end
