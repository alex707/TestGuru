class User < ApplicationRecord
  has_many :surveys, dependent: :destroy
  has_many :tests, through: :surveys
  has_many :own_tests, class_name: 'Test', dependent: :nullify, foreign_key: :author_id

  validates :email, presence: true

  scope :by_level, -> (level) { joins(:tests).where(level: level) }
end
