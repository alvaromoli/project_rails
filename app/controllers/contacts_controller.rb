class ContactsController < ApplicationController

  def create
    generated_password = Devise.friendly_token.first(8)
    @contact = Contact.new(sign_up_params.except(:questions_attributes, :program))
    @program = Program.find(sign_up_params[:program])
    @question_body = sign_up_params[:questions_attributes]["0"]["body"]
    #falta controlar cuando no existe asignación de ejecutivo a programa
    if Contact.where(email: @contact.email).exists?
      @contact = Contact.where(email: sign_up_params[:email]).first
      @contact.assign_last_executive unless @contact.has_the_same_postulation?(@program)
    else
      @contact.password = generated_password
      if @contact.save
        @contact.assign_executive(@program)
      end
    end
    @contact.save_question
    flash[:notice] = 'Thanks for registering your data. A executive will contact you soon!'
    redirect_to program_path(@program)
  end

  protected
  def sign_up_params
    params.require(:contact).permit(:names, :lastnames, :phone, :email, :program, questions_attributes: [:body])
  end

end
