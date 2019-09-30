class CcenterController < ApplicationController
  def index
    if current_user.present?
      @leads = current_user.postulations.where(status: [:lead])
      @contacts = current_user.postulations.where(status: [:contact])
      @postulations = current_user.postulations.where(status: [:postulated])
      @all = current_user.postulations
      respond_to do |format|
        format.html
        format.json { render json: @leads }
      end
    else
      redirect_to root_path
    end
  end
end
