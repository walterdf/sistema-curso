class Admin::CursosController < ApplicationController
  layout 'painel_admin'
  before_action :admin_logged_in?

  def index
    @page = (params[:pg].to_i == 0 ? 1 : params[:pg].to_i)
    @limit_page = Site::PG

    @valorNome = "%#{params[:nome]}%"

    @num_result = Curso
        .where(" name like ?
        ", @valorNome).length

    @num_result = (Float(@num_result) / Float(@limit_page)).ceil

    @cursos = Curso
        .where(" name like ?
        ", @valorNome)
        .limit(@limit_page).offset((@page == 1 ? 0 : ((@page.to_i * @limit_page.to_i) - @limit_page.to_i) ));
  end

  def delete
    Usuariocurso.where(curso_id: params[:id]).destroy_all
    Curso.where(id: params[:id]).destroy_all
    Video.where(curso_id: params[:id]).destroy_all

    flash[:notice] = "Curso removido!"
    redirect_to :action => "index"
  end

  def novo
    @cursos = Curso.new
  end

  def create
    flash[:notice] = nil
    @cursos = Curso.find_by(name: params[:cursos][:name])

    unless @cursos.nil?
      flash[:alert] = "O nome desse curso já existe!"
      render :novo
    else
      @cursos = Curso.new
      @cursos.name = params[:cursos][:name]
      @cursos.url_thumb = params[:cursos][:url_thumb]
      @cursos.descricao = params[:cursos][:descricao]

      if @cursos.save
        flash[:notice] = "Curso criado com sucesso!"
        redirect_to :action => "index"
      else
        flash[:alert] = "Não foi possível criar esse curso!"
        render :novo
      end
    end
  end

  def edit
    @cursos = Curso.find_by(id: params[:id])
  end

  def update
    @cursos = Curso.find_by(id: params[:cursos][:edit_id])
    @cursos.name = params[:cursos][:name]
    @cursos.url_thumb = params[:cursos][:url_thumb]
    @cursos.descricao = params[:cursos][:descricao]

    if @cursos.save
      flash[:notice] = "Dados salvos com sucesso!"
    else
      flash[:alert] = "Não foi possível salvar os dados do curso!"
    end

    redirect_to :action => "index"
  end
end
