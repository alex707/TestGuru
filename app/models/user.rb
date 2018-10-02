class User < ApplicationRecord
  has_many :surveys, dependent: :destroy
  has_many :tests, through: :surveys
  has_many :own_tests, class_name: 'Test', dependent: :nullify, foreign_key: :author_id

  validates :email, presence: true

  def survey(test)
    surveys.order(id: :desc).find_by(test_id: test.id)
  end

  def by_level(level)
    tests.where(level: level)
  end
end
