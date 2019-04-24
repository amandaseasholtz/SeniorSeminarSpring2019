class Request < ApplicationRecord
    belongs_to :employee, optional: true
    belongs_to :budget, optional: true

    has_one :employee
    has_many :budget

    has_many :expected_costs,dependent: :destroy
    has_many :expected_expenses,dependent: :destroy
    has_many :payment_informations,dependent: :destroy

    accepts_nested_attributes_for :expected_costs,:allow_destroy => true
    accepts_nested_attributes_for :expected_expenses,allow_destroy: true
    accepts_nested_attributes_for :payment_informations,allow_destroy: true
    


end
