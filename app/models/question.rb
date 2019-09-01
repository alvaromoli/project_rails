class Question < ApplicationRecord
  belongs_to :postulation
  validates :body, :postulation, presence: true
  validates_uniqueness_of :postulation, scope: %i[body]
end
