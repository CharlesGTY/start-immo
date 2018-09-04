class Document < ApplicationRecord
  belongs_to :house
  belongs_to :document_type

  mount_uploader :pdf, DocumentUploader
end
