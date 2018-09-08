class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :surveys
  has_many :users, through: :serveys

  def self.categories_tests(name)
    Test.where("categories.title = ?", name).
      joins("inner join categories on categories.id = tests.category_id").
      order(id: :desc).
      map(&:title)
  end
end
