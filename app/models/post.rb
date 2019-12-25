class Post < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :content, presence: true
end
