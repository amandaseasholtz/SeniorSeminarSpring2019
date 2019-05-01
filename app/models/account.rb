class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :accountable, polymorphic: true
  ACCOUNT_TYPES=["SuperAccount", "Payment", "Budget","Employee"]
  attr_accessor :type
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
