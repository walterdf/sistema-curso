class Admin::AcessoController < ApplicationController
  layout 'painel_admin'
  before_action :admin_logged_in?

  def index
    if params[:iduser].present?
      @usuario_id = params[:iduser]
      @usuario = Usuario.find(@usuario_id)
      @usuariocurso = Usuariocurso.select("
          usuariocursos.*,
          cursos.name as nome_curso")
          .from(" usuariocursos, cursos, usuarios ")
          .where(" usuariocursos.usuario_id = usuarios.id
          AND usuariocursos.curso_id = cursos.id
          AND usuarios.id = ?
          ", @usuario_id);
    else
      redirect_to :controller => "usuarios", :action => "index"
    end
  end

  def delete
    Usuariocurso.find(params[:id]).destroy
    flash[:notice] = "Acesso removido com sucesso!"
    redirect_to :action => "index", :iduser => params[:iduser]
  end

  def novo
    @curso = Curso.all
  end

  def create
      usuarioDel = Usuariocurso.where(usuario_id: params[:acesso][:usuario_id]).where(curso_id: params[:acesso][:curso]).delete_all

      @usuariocurso = Usuariocurso.new
      @usuariocurso.usuario_id = params[:acesso][:usuario_id]
      @usuariocurso.curso_id = params[:acesso][:curso]
      @usuariocurso.data = Date.parse("#{params[:acesso][:data][6..10]}-#{params[:acesso][:data][3..4]}-#{params[:acesso][:data][0..1]}")

      if @usuariocurso.save
        flash[:notice] = "Curso atríbuido com sucesso!"
        redirect_to :action => "index", :iduser => params[:acesso][:usuario_id]
      else
        flash[:alert] = "Não foi possível atríbuir o curso!"
        render :novo
      end
  end

  def edit
    @usuario = Usuario.find_by(id: params[:iduser])
    @curso = Curso.all
    @usuariocurso = Usuariocurso.find_by(id: params[:id])
  end

  def update
    @curso = Usuariocurso.find_by(id: params[:acesso][:edit_id])
    @curso.curso_id = params[:acesso][:curso]
    @curso.data = params[:acesso][:data]

    if @curso.save
      flash[:notice] = "Dados salvos com sucesso!"
    else
      flash[:alert] = "Não foi possível salvar os dados do faq!"
    end

    redirect_to :action => "index", :iduser => params[:acesso][:usuario_id]
  end
end
