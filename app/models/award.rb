class Award < ApplicationRecord
  include BadgeChecker

  belongs_to :badge
  belongs_to :user
end
