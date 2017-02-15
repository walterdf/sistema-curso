class Admin::VideosController < ApplicationController
  layout 'painel_admin'
  before_action :admin_logged_in?

  def index
    if params[:idcurso].present?
      @curso = Curso.find(params[:idcurso])
      @video = Video.where(curso_id: params[:idcurso]);
    else
      redirect_to :controller => "cursos", :action => "index"
    end
  end

  def delete
    Video.find(params[:id]).destroy
    flash[:notice] = "Vídeo removido com sucesso!"
    redirect_to :action => "index", :idcurso => params[:idcurso]
  end

  def novo
  end

  def create
      @video = Video.new
      @video.name = params[:video][:name]
      @video.html = params[:video][:html]
      @video.duration = params[:video][:duration]
      @video.curso_id = params[:video][:curso_id]

      if @video.save
        flash[:notice] = "Vídeo adicionado com sucesso!"
        redirect_to :action => "index", :idcurso => params[:video][:curso_id]
      else
        flash[:alert] = "Não foi possível adicionar o vídeo!"
        render :novo
      end
  end

  def edit
    @video = Video.find_by(id: params[:idcurso])
  end

  def update
    @video = Video.find_by(id: params[:video][:edit_id])
    @video.name = params[:video][:name]
    @video.html = params[:video][:html]
    @video.duration = params[:video][:duration]

    if @video.save
      flash[:notice] = "Vídeo salvo com sucesso!"
    else
      flash[:alert] = "Não foi possível salvar o vídeo!"
    end

    redirect_to :action => "index", :idcurso => params[:video][:curso_id]
  end
end
