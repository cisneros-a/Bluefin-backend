class Lease < ApplicationRecord
  belongs_to :landlord, :class_name => 'User'
  belongs_to :tenant, :class_name => 'User'
  belongs_to :property
end
