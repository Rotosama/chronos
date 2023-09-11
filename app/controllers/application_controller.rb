class ApplicationController < ActionController::Base
  before_action :authenticate_worker!

  def after_sign_in_path_for(resource)
    if resource.admin?
      root_path
    else
      worker_path(current_worker)
    end
  end

  def after_sign_out_path(resource_or_scope)
    new_worker_session_path
  end
end
