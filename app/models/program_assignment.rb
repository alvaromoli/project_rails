class ProgramAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :program
  enum status: [
    :active,
    :unactive
  ]
end
