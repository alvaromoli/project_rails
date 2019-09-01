class Contact < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :postulations
  has_many :questions, through: :postulations
  has_many :users, through: :postulations
  has_many :programs, through: :postulations
  accepts_nested_attributes_for :questions

  before_validation :set_random_password

  validates :names, :lastnames, :phone, :email, presence: true

 private
 
  def set_random_password
    generated_password = Devise.friendly_token.first(8)
    self.password = generated_password
  end
end
