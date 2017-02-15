class Admin::UsuariosController < ApplicationController
  layout 'painel_admin'
  before_action :admin_logged_in?

  def index
    @page = (params[:pg].to_i == 0 ? 1 : params[:pg].to_i)
    @limit_page = Site::PG

    @valorNome = "%#{params[:nome]}%"
    @valorEmail = "%#{params[:email]}%"

    @num_result = Usuario
        .where(" usuarios.tipo_conta = 0
        AND usuarios.nome_completo like ?
        AND usuarios.email like ?
        ", @valorNome, @valorEmail).length

    @num_result = (Float(@num_result) / Float(@limit_page)).ceil

    @usuarios = Usuario
        .where(" usuarios.tipo_conta = 0
        AND usuarios.nome_completo like ?
        AND usuarios.email like ?
        ", @valorNome, @valorEmail)
        .limit(@limit_page).offset((@page == 1 ? 0 : ((@page.to_i * @limit_page.to_i) - @limit_page.to_i) ));
  end

  def delete
    Usuariocurso.where(usuario_id: params[:id]).destroy_all
    Usuario.find(params[:id]).destroy
    flash[:notice] = "Usuário removido com sucesso!"
    redirect_to :action => "index"
  end

  def novo
    @user = Usuario.new
  end

  def create
    flash[:notice] = nil
    @user = Usuario.find_by(email: params[:usuario][:email])

    unless @user.nil?
      flash[:alert] = "O email informado já existe!"
      render :novo
    else
      @nova_senha = rand(1000..9999).to_s

      @user = Usuario.new
      @user.nome_completo = params[:usuario][:nome_completo]
      @user.password = @nova_senha
      @user.email = params[:usuario][:email]
      @user.telefone = params[:usuario][:telefone]
      @user.celular = params[:usuario][:celular]

      if @user.save
        flash[:notice] = "Usuário criado com sucesso, senha para acesso: #{@nova_senha}"
        redirect_to :action => "index"
      else
        flash[:alert] = "Não foi possível criar esse usuário!"
        render :novo
      end
    end
  end

  def edit
    @user = Usuario.find_by(id: params[:id])
  end

  def reset_senha
    @nova_senha = rand(1000..9999).to_s

    @user = Usuario.find_by(id: params[:id])
    @user.password = @nova_senha

    if @user.save
      flash[:notice] = "Senha resetada: #{@nova_senha}"
    else
      flash[:alert] = "Não foi possível resetar a senha!"
    end

    redirect_to :action => "index"
  end

  def update
    @user = Usuario.find_by(id: params[:usuario][:edit_id])
    @user.nome_completo = params[:usuario][:nome_completo]
    @user.email = params[:usuario][:email]
    @user.telefone = params[:usuario][:telefone]
    @user.celular = params[:usuario][:celular]

    if @user.save
      flash[:notice] = "Dados salvos com sucesso!"
    else
      flash[:alert] = "Não foi possível salvar os dados do usuário!"
    end

    redirect_to :action => "index"
  end
end
