class House < ApplicationRecord
  belongs_to :owner
  belongs_to :user
  has_many :documents
  monetize :price_cents
  mount_uploader :photo, PhotoUploader
end
