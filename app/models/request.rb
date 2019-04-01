class Request < ApplicationRecord
    belongs_to :employee, optional: true
    belongs_to :budget, optional: true
end
