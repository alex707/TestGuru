class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :users, through: :surveys
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates_numericality_of :level, greater_than_or_equal_to: 0
  validates_uniqueness_of :title, scope: :level

  def self.by_category(name)
    where(categories: { title: name }).
      joins(:category).
      order(id: :desc)
  end

  def self.difficulty_level(level)
    lvl = case level
          when :easy
            0..1
          when :normal
            2..4
          when :hard
            5..Float::INFINITY
          end
    where(level: lvl)
  end
end
