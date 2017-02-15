class SuporteController < ApplicationController
  layout 'painel'
  before_action :logged_in?

  def index
    flash[:notice] = nil
  end

  def envia_mensagem
    @user = Usuario.find_by(id: session[:user_id])
    UserMailer.contato(@user,params[:suporte][:assunto],params[:suporte][:mensagem]).deliver
    flash[:notice] = "Sua mensagem foi enviada com sucesso!"
    render :index
  end
end
