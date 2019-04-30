class Request < ApplicationRecord
    belongs_to :employee, optional: true
    belongs_to :budget, optional: true

    has_many :expects, dependent: :destroy
end
