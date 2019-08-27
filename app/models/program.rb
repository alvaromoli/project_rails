class Program < ApplicationRecord
  belongs_to :period
  belongs_to :department

  has_many :program_assignments
  has_many :postulations
  has_many :users, through: :program_assignments
  enum status: [
    :active,
    :unactive
  ]
end
