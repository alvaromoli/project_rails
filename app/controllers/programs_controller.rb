class ProgramsController < ApplicationController
  def index
    if params[:search].present?
      @programs = search_program(params[:search])
    else
      @programs = Program.all
    end
  end

  def show
    @program = Program.find(params[:id])
    @contact = Contact.new
    @postulation = @contact.postulations.build(program: @program)
  end

  private
  def search_program(query)
    Program.where(["(name LIKE ? OR description LIKE ?) AND status = ?", "%#{query}%", "%#{query}%", Program.statuses[:active]])
  end
end
