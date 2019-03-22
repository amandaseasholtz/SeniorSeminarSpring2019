class Account < ApplicationRecord
  belongs_to :accountable, polymorphic: true
  ACCOUNT_TYPES=["Employee", "BudgetApprover", "PaymentManager"]
  attr_accessor :type
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
