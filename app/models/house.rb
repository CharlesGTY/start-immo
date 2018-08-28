class House < ApplicationRecord
  belongs_to :owner
  belongs_to :user
  monetize :price_cents
  mount_uploader :photo, PhotoUploader

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
