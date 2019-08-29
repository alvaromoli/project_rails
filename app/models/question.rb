class Question < ApplicationRecord
  belongs_to :postulation
  validates :body, presence: true
end
