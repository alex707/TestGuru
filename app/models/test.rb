class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :delete_all
  has_many :surveys, dependent: :delete_all
  has_many :users, through: :surveys
  belongs_to :author, class_name: 'User'

  def self.by_category(name)
    Test.where(categories: { title: name }).
      joins(:category).
      order(id: :desc).
      pluck(:title)
  end
end
