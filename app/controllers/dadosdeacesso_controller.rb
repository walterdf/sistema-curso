class DadosdeacessoController < ApplicationController
  layout 'painel'
  before_action :logged_in?

  def index
      flash[:notice] = nil
      flash[:alert] = nil
  end

  def update
    flash[:alert] = nil
    flash[:notice] = nil
    @user = Usuario.find_by(id: session[:user_id])

    if !@user.authenticate(params[:acesso][:senha_atual])
      flash[:alert] = "Senha atual inválida!"
    elsif params[:acesso][:nova_senha] != params[:acesso][:repita_nova_senha]
      flash[:alert] = "Repita corretamente sua nova senha!"
    elsif params[:acesso][:nova_senha].mb_chars.length <= 3
      flash[:alert] = "Sua nova senha deve ter no mínimo 4 caracteres!"
    else
      @user.password = params[:acesso][:nova_senha]
      if @user.save
        flash[:notice] = "Senha alterada com sucesso!"
      end
    end
    render :index
  end
end
