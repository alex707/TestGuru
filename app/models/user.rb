class User < ApplicationRecord
  has_many :surveys, dependent: :destroy
  has_many :tests, through: :surveys
  has_many :own_tests, class_name: 'Test', dependent: :nullify, foreign_key: :author_id

  validates :email, presence: true

  def by_level(level)
    Test.where(level: level, surveys: { user: self }).
      joins(:surveys)
  end
end
