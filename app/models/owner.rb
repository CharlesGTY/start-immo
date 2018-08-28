class Owner < ApplicationRecord
  has_many :houses
  has_many :documents
end
