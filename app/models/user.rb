class User < ApplicationRecord
  has_many :surveys, dependent: :delete_all
  has_many :tests, through: :surveys
  has_many :tasks, class_name: 'Test', dependent: :nullify, foreign_key: :author_id

  def by_level(level)
    Test.where(level: level).
      joins(:surveys).
      where(surveys: { user: self })
  end
end
