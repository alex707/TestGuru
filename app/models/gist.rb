class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, presence: true
  validates :content, presence: true
end
