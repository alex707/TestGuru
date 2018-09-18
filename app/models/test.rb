class Test < ApplicationRecord
  DIFFICULTY_LEVEL = { easy: 0..1, normal: 2..4, hard: 5..Float::INFINITY }

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :users, through: :surveys

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, -> (name) { where(categories: { title: name }).joins(:category).order(id: :desc) }
  scope :difficulty_level, -> (level) { where(level: DIFFICULTY_LEVEL[level]) }
end
