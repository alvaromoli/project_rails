class Postulation < ApplicationRecord
  belongs_to :user
  belongs_to :program
  belongs_to :contact
  enum status: [
    :lead,
    :declined,
    :interested,
    :uninteresed,
    :inadmissible,
    :waiting,
    :accepted,
    :rejected,
    :pending,
    :paying,
    :matriculated,
    :abdicated
  ]
  has_many :questions
end
