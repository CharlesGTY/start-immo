class Document < ApplicationRecord
  belongs_to :house
  belongs_to :document_type
  validates :document_type, presence: true
  mount_uploader :pdf, DocumentUploader
end
