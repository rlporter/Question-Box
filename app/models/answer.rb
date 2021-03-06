class Answer < ApplicationRecord
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
end
