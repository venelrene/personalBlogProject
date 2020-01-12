class Comment < ApplicationRecord
  validates :name, :comment, presence: true, length: { minimum: 4 }

  belongs_to :post
end
