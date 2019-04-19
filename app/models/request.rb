class Request < ApplicationRecord
    belongs_to :employee, optional: true
    belongs_to :budget, optional: true

    has_one :employee
    has_many :budget
    


end
