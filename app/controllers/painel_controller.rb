class PainelController < ApplicationController
  layout 'painel'
  before_action :block_access, except: [:destroy, :meus_cursos]

  def index
    render layout: 'login'
  end

  def login
    valores = params.require(:usuario).permit(:email,:password)

    @user = Usuario.find_by(email: valores[:email])

    unless !@user.nil?
      flash[:alert] = "O email informado não existe!"
      redirect_to root_url
    else
      if @user && @user.authenticate(valores[:password])
          sign_in(@user)
          redirect_to :controller=>'meus_cursos', :action=>'index'
      else
          flash[:alert] = "Senha inválida!"
          redirect_to root_url
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def esqueci_senha
    render layout: 'login'
    #UserMailer.lembrar_senha.deliver
  end
end
