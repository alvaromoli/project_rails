class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    ccenter_path
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    programs_path
  end
end
