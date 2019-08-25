class ContactsController < ApplicationController
  def create
    #code

    generated_password = Devise.friendly_token.first(8)
    @contact = Contact.new(sign_up_params.except(:questions_attributes, :program))
    debugger
    #contact.password = generated_password
    if has_postulation_before?
      #save_only_question
    else
      assign_new_executive
    end
  end

  protected
  def sign_up_params
    #code
    params.require(:contact).permit(:names, :lastnames, :phone, :email, :program, questions_attributes: [:body])
  end

  def assign_new_executive
    #code
  end


  def has_postulation_before?
    Postulation.where(contact: Contact.where(email: @contact.email), program: Program.find(sign_up_params[:program])).last
  end
end
