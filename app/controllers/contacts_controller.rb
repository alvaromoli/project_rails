class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @contact.postulations.build
  end

  def create
    contact = Contact.new(sign_up_params.except(:questions_attributes))
    program = Program.find(program_params[:program_id])
    question_body = params[:contact][:questions_attributes]["0"][:body]
    respond_to do |format|
      unless contact.save
        contact = Contact.where(email: sign_up_params[:email]).first
      end
      post = contact.postulations.build(program: program, status: 0)
      unless post.save
        post = contact.postulations.where(program: program).first
      end
      question = post.questions.build(body: question_body)
      question.save
      #debugger
      flash[:notice] = "Contact successfully created"
      format.html { redirect_to program_path(program_params[:program_id]) }
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @last_post = @contact.postulations.last
    @questions = @last_post.questions
  end

  protected
  def sign_up_params
    params.require(:contact).permit(:names, :question, :lastnames, :phone, :email, :questions_attributes)
  end

  def program_params
    params.require(:contact).permit(:program_id)
  end

end
