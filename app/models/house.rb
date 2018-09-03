class House < ApplicationRecord
  belongs_to :owner
  belongs_to :user
  has_many :documents
  monetize :price_cents
  monetize :net_price_seller_cents
  monetize :agence_fee_cents
  monetize :annual_charges_cents
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
    pg_search_scope :global_search,
      against: [ :address ],
      associated_against: {
        owner: [ :first_name, :last_name ]
      },
      using: {
        tsearch: { prefix: true }
      }
end
