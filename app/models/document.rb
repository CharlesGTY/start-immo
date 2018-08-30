class Document < ApplicationRecord
  belongs_to :house
  belongs_to :document_type
end
