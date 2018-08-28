class House < ApplicationRecord
  belongs_to :owner
  belongs_to :user
  monetize :price_cents
  mount_uploader :photo, PhotoUploader
end
