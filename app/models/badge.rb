class Badge < ApplicationRecord
  has_many :users, through: :awards
end
