class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :surveys
  has_many :users, through: :serveys
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.by_category(name)
    Test.where(categories: { title: name }).
      joins("inner join categories on categories.id = tests.category_id").
      order(id: :desc).
      pluck(:title)
  end
end
