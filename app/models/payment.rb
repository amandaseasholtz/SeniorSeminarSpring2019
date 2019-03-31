class Payment < ApplicationRecord
    has_one :account, as: :accountable
end
