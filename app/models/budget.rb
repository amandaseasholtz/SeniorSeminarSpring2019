class Budget < ApplicationRecord
    
    #belongs_to :department, optional: true
    has_one :account, as: :accountable
    has_many :requests
end
