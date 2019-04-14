module ApplicationHelper
  def auth
    session[:auth]
  end

  def admin
    session[:auth] && (session[:auth]['role_id'] == 1)
  end
end
