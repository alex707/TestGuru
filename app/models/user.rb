class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  #include Auth

  has_many :surveys, dependent: :destroy
  has_many :tests, through: :surveys
  has_many :own_tests, class_name: 'Test', dependent: :nullify, foreign_key: :author_id
  has_many :gists
  has_many :badges, through: :awards

  def survey(test)
    surveys.order(id: :desc).find_by(test: test)
  end

  def by_level(level)
    tests.where(level: level)
  end

  def admin?
    is_a?(Admin)
  end
end
