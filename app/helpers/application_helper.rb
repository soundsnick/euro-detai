module ApplicationHelper
  def auth
    session[:auth]
  end

  def admin
    session[:auth] && (session[:auth]['role_id'] == 1)
  end

  def texts
    Text.where(action: params[:action]).order(counter: :desc)
  end

end
