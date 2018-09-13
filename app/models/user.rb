class User < ApplicationRecord
  has_many :surveys
  has_many :tests, through: :surveys
  has_many :tests

  def by_level(level)
    Test.where(level: level).
      joins("inner join surveys on surveys.test_id = tests.id").
      where("surveys.user_id = ?", self.id)
  end
end
