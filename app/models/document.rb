class Document < ApplicationRecord
  belongs_to :house
  belongs_to :document_type
  belongs_to :owner
end
