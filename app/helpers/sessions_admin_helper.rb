module SessionsAdminHelper
  def admin_sign_in(user)
    session[:user_admin_id] = user.id
  end

  def current_admin_user
    @current_admin_user ||= Usuario.find_by(id: session[:user_admin_id])
  end

  def admin_block_access
    if current_admin_user.present?
        redirect_to :controller => 'admin/usuarios', :action => 'index'
    end
  end

  def admin_logged_in?
    if current_admin_user.nil?
      redirect_to :controller => 'admin/admin', :action => 'index'
    end
  end

  def admin_sign_out
    session.delete(:user_admin_id)
    @current_admin_user = nil
  end
end
