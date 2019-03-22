class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, :content, presence: true
end
