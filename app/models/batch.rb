class Batch < ApplicationRecord
  has_many :batch_memberships
  has_many :batch_days
end
