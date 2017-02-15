class DadoscadastraisController < ApplicationController
  layout 'painel'
  before_action :logged_in?

  def index
      flash[:notice] = nil
      flash[:alert] = nil
      @user = Usuario.find_by(id: session[:user_id])
  end

  def update
    valores = params.require(:usuario).permit(:nome_completo,:celular,:telefone)
    @user = Usuario.find_by(id: session[:user_id])

    if @user.update_attributes valores
      flash[:notice] = "Dados atualizados com sucesso!"
    else
      flash[:alert] = "Não foi possível atualizar os seus dados, entre em contato com o suporte!"
    end
    render :index
  end
end
