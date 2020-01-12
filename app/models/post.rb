class Post < ApplicationRecord
  validates :title, uniqueness: true, presence: true, length: { minimum: 4 }
  validates :content, presence: true, length: { minimum: 10 }

  has_many :comments, dependent: :destroy
end
