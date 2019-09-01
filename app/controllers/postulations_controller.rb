class PostulationsController < ApplicationController
  def new
    @postulation = Postulation.new
    @postulation.contacts.build
    @postulation.questions.build
  end

  def create
    #@program = Program.find(program_params[:program])
    debugger
  end

  private
  def program_params
    params.require(:postulation).permit(keys: [:program])
  end

  def contact_params
    params.require(:postulation).permit(:names, :lastnames, :phone, :email)
  end

  def question_params
    params.require(:postulation).permit(:question_attributes)
  end
end
