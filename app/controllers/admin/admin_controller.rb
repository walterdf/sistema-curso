class Admin::AdminController < ApplicationController
  layout 'login'
  before_action :admin_block_access, except: [:destroy, :login, :reset_conta]

  def index
  end

  def destroy
    admin_sign_out
    flash[:alert] = nil
    render :index
  end

  def reset_conta
    @user = Usuario.find_by(email: "curso@editorasolucao.com.br", tipo_conta: 1)
    unless !@user.nil?
      @user = Usuario.new
      @user.nome_completo = "Administrador"
      @user.password = "@solucao424"
      @user.email = "curso@editorasolucao.com.br"
      @user.tipo_conta = 1
    else
      @user.password = "@solucao424"
    end
    @user.save

    flash[:notice] = "Conta resetada!"
    render 'index'
  end

  def login
    valores = params.require(:admin_user).permit(:email,:password)
    @admin_user = Usuario.find_by(email: valores[:email], tipo_conta: 1)

    unless !@admin_user.nil?
      flash[:alert] = "O email informado não existe!"
      render 'index'
    else
      if @admin_user && @admin_user.authenticate(valores[:password])
          admin_sign_in(@admin_user)
          redirect_to :controller => 'admin/usuarios', :action => 'index'
      else
          flash[:alert] = "Senha inválida!"
          render 'index'
      end
    end
  end
end
