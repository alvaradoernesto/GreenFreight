class Review < ApplicationRecord
  belongs_to :truck
  belongs_to :user
  validates :content, presence: true
end
