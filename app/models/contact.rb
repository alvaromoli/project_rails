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

  validates :names, :lastnames, :phone, :email, presence: true

  #self nombremetodo para métodos de clase que se llaman en cualquier lado
  #def nombremetodo método de instancia

  private

  def assign_executive(program)
    assign_regs = program.program_assignments.order(:assign_value, :asc)
    if assign_regs.count > 0
      switch = false
      assign_regs.each do |assignment|
        if switch == false
          p = self.postulations.build(user_id: assignment.user_id, program: program, status: [:lead])
          p.save
          assignment.assign_value = assign_regs.count
          switch = true
        else
          assignment.assign_value -= 1
        end
        assignment.save
      end
    else

    end
  end

  def assign_last_executive(program)
    last_post = self.postulations.last
    p = self.postulations.build(program: program, user_id: last_post.user_id, status: Postulation.statuses[:lead])
    p.save
  end

  def save_question(question_body)
    if question_body.length > 0
      q = self.questions.build(body: question_body, postulation: self.postulations.last)
      q.save
    end
  end

  def has_the_same_postulation?(program)
    self.postulations.where(program: program).present?
  end

  def questions_attributes=(attributes)
    @question ||= []
    attributes.each do |i, questions_params|
      @question.push(Question.new(questions_params))
    end
  end
end
