class User < ApplicationRecord
  has_many :surveys, dependent: :destroy
  has_many :tests, through: :surveys
  has_many :own_tests, class_name: 'Test', dependent: :nullify, foreign_key: :author_id

  def by_level(level)
    self.tests.where(level: level)
  end
end
