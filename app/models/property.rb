class Property < ApplicationRecord
  belongs_to :user
  has_one_attached :uploads
end
