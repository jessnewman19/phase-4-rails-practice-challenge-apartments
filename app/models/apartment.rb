class Apartment < ApplicationRecord
    has_many :leases 
    has_many :tenants, through: :leases 

    # validates :number, presence: true, uniqueness: true, numericality: { greater_than: 0 }

end
