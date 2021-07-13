class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    
   ## Added on 7.13.2021 #######################
    before_action :block_ip_addresses

  protected

  def block_ip_addresses
    head :unauthorized if current_ip_address[0..2] == "10."
  end

  def current_ip_address
    request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
  end
#################################################
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  protect_from_forgery with: :exception
  def index
      @horses = Horse.order(params[:sort])
  end
end
