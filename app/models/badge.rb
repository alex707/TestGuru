class Badge < ApplicationRecord
  has_many :awards
  has_many :users, through: :awards
end
