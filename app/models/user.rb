require 'digest/sha1'

class User < ApplicationRecord

  #include Auth

  has_many :surveys, dependent: :destroy
  has_many :tests, through: :surveys
  has_many :own_tests, class_name: 'Test', dependent: :nullify, foreign_key: :author_id

  validates :email, format: { with: /\A.+@.+\z/ }, uniqueness: true

  has_secure_password

  def survey(test)
    surveys.order(id: :desc).find_by(test: test)
  end

  def by_level(level)
    tests.where(level: level)
  end
end
