class Postulation < ApplicationRecord
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

  before_save :assign_user

  validates_uniqueness_of :program, scope: %i[contact_id]

  private

  def assign_user
    if self.user_id.nil?
      if self.contact.postulations.count > 0
        self.user_id = self.contact.postulations.order(:created_at, :asc).last
      elsif self.program.program_assignments.count == 0
        self.user_id = User.where(role: [:executive]).offset(rand(User.count)).first.id
      else
        switch = false
        self.program.program_assignments.each do |pa|
          if switch == false
            switch = true
            ex = User.find(pa.user_id)
            pa.assign_value = self.program.program_assignments.count
          else
            pa.assign_value -= 1
          end
          pa.save
        end
      end
    end
  end
end
