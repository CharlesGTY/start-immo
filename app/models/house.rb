class House < ApplicationRecord
  belongs_to :owner
  belongs_to :agent
  monetize :price_cents
end
