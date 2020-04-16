class Fix < ApplicationRecord
  belongs_to :landlord, :class_name => 'User'
  belongs_to :tenant, :class_name => 'User'
  belongs_to :property
  has_one_attached :uploads
end
