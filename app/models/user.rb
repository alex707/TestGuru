class User < ApplicationRecord
  has_many :surveys
  has_many :tests, through: :surveys

  def check_level(level)
    Test.where(level: level).joins(:surveys).
      where("surveys.user_id = ?", self.id)
  end
end
