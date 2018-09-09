class User < ApplicationRecord
  def by_level(level)
    Test.where(level: level).
      joins("inner join surveys on surveys.test_id = tests.id").
      where("surveys.user_id = ?", self.id)
  end
end
