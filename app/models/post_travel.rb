class PostTravel < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :budget, optional: true

  has_many :actuals, dependent: :destroy


  mount_uploader :receipt,  UploadUploader



  validates :receipt, allow_blank: true, format: {
with:%r{\.(pdf)\Z}i,
message: 'must be a PDF.'
}
  belongs_to :payment, optional: true

  has_one :employee
  has_one :payment
end
