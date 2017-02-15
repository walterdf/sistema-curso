class PainelController < ApplicationController
  layout 'login'
  before_action :block_access, except: [:destroy, :meus_cursos]

  def index
    flash[:notice] = nil
    flash[:alert] = nil
  end

  def login
    valores = params.require(:usuario).permit(:email,:password)
    @user = Usuario.find_by(email: valores[:email])

    unless !@user.nil?
      flash[:alert] = "O email informado não existe!"
      render 'index'
    else
      if @user && @user.authenticate(valores[:password])
          sign_in(@user)
          redirect_to :controller=>'meus_cursos', :action=>'index'
      else
          flash[:alert] = "Senha inválida!"
          render 'index'
      end
    end
  end

  def destroy
    sign_out
    flash[:alert] = nil
    redirect_to root_url
  end

  def esqueci_senha
    #UserMailer.lembrar_senha.deliver
  end

  def request_email
    valores = params.require(:usuario).permit(:email)
    @user = Usuario.find_by(email: valores[:email])

    unless !@user.nil?
      flash[:alert] = "O email informado não existe!"
      render 'esqueci_senha'
    else
      @user.password = rand(1000..9999).to_s
      if @user.save
        UserMailer.lembrar_senha(@user).deliver
        flash[:notice] = "Enviamos uma nova senha para seu e-mail!"
        render 'index'
      end
    end
  end
end
