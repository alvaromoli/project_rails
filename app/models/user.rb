class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [
    :admin,
    :director,
    :leader,
    :supervisor,
    :executive,
    :coordinator,
    :assistant,
    :contact
  ]

  has_many :program_assignments
  has_many :programs, through: :program_assignments
  has_many :postulations
  has_many :contacts, through: :postulations
  has_many :questions, through: :postulations
end
