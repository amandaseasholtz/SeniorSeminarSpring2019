class PostTravel < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :budget, optional: true

  mount_uploader :receipt,  UploadUploader

  validates :receipt, allow_blank: true, format: {
with:%r{\.(gif|jpg|png)\Z}i,
message: 'must be a URL for GIF, JPG or PNG image.'
}
end
