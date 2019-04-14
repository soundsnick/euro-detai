class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def auth_error(msg)
    redirect_to login_path, notice: msg
  end

  def auth
    session[:auth]
  end

  def admin
    session[:auth] && (session[:auth]['role_id'] == 1)
  end

  def construct_response(status, message, body = nil)
    json = {
        headers: {
            status: status,
            message: message
        },
        body: body
    }
  end
end
