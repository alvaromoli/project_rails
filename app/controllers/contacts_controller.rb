class ContactsController < ApplicationController

  def create
    generated_password = Devise.friendly_token.first(8)
    @contact = Contact.new(sign_up_params.except(:questions_attributes, :program))
    @program = Program.find(sign_up_params[:program])

    #falta controlar cuando no existe asignación de ejecutivo a programa
    if Contact.where(email: @contact.email).exists?
      @contact = Contact.where(email: sign_up_params[:email]).first
      assign_last_executive unless has_the_same_postulation?
    else
      @contact.password = generated_password
      @contact.save
      assign_new_executive
    end
    save_question
    flash[:notice] = 'Thanks for registering your data. A executive will contact you soon!'
    redirect_to root_path
  end

  protected
  def sign_up_params
    params.require(:contact).permit(:names, :lastnames, :phone, :email, :program, questions_attributes: [:body])
  end

  def has_the_same_postulation?
    @contact.postulations.where(program: @program).present?
  end

  def assign_new_executive
    assign_regs = @program.program_assignments.order(:assign_value, :desc)
    switch = false
    assign_regs.each do |assignment|
      if switch == false
        p = @contact.postulations.build(user_id: assignment.user_id, program: @program)
        p.save
        assignment.assign_value = assign_regs.count
        switch = true
      else
        assignment.assign_value -= 1
      end
      assignment.save
    end
  end

  def assign_last_executive
    last_post = @contact.postulations.last
    p = @contact.postulations.build(program_id: sign_up_params[:program], user_id: last_post.user_id, status: [:lead])
    p.save
  end

  def save_question
    q = @contact.questions.build(body: sign_up_params[:questions_attributes]["0"]["body"], postulation: @contact.postulations.last)
    q.save
  end
end
