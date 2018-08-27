class DocumentCreation < ApplicationRecord
  belongs_to :house
  belongs_to :document_template
  belongs_to :document_status
end
