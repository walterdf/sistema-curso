module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= Usuario.find_by(id: session[:user_id])
  end

  def block_access
    if current_user.present?
        redirect_to :controller => 'meus_cursos', :action => 'index'
    end
  end

  def logged_in?
    if current_user.nil?
      redirect_to root_url
    end
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end
