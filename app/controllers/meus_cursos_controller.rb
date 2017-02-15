class MeusCursosController < ApplicationController
  layout 'painel'
  before_action :logged_in?

  def index
    flash[:alert] = nil
    @cursos = Curso.select('cursos.* , (select count(*) as qtd from videos where videos.curso_id = cursos.id) as qtd ').where(' id in (select curso_id from usuariocursos where usuariocursos.usuario_id = ? and usuariocursos.data >= NOW())', session[:user_id])
  end

  def curso
    flash[:alert] = nil
    @qtd = Curso.select('cursos.* , (select count(*) as qtd from videos where videos.curso_id = cursos.id) as qtd ').where(' id in (select curso_id from usuariocursos where usuariocursos.usuario_id = ? and usuariocursos.data >= NOW() and usuariocursos.curso_id = ?)', session[:user_id], params[:id]).length

    puts @qtd

    if @qtd > 0
      curso = Curso.where(' id = ? ', params[:id]).first

      @curso_nome = curso[:name]
      @curso_descricao = curso[:descricao]

      @videos = Video.where(' curso_id = ? ', params[:id])
    else
      @curso_nome = ""
      @curso_descricao = ""

      @videos = Video.new
      flash[:alert] = "Você tentou acessar um curso no qual não possui permissão!"
    end
  end
end
