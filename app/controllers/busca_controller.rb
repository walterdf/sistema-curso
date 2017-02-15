class BuscaController < ApplicationController
  layout 'painel'
  before_action :logged_in?

  def index
    flash[:alert] = nil
    @expressao = params[:nome]
    @qtd = Curso.select('cursos.* , (select count(*) as qtd from videos where videos.curso_id = cursos.id) as qtd ').where(' id in (select curso_id from usuariocursos where usuariocursos.usuario_id = ? and usuariocursos.data >= NOW()) and name like ? ', session[:user_id], "%#{@expressao}%").length

    if @qtd > 0
      @cursos = Curso.select('cursos.* , (select count(*) as qtd from videos where videos.curso_id = cursos.id) as qtd ').where(' id in (select curso_id from usuariocursos where usuariocursos.usuario_id = ? and usuariocursos.data >= NOW()) and name like ? ', session[:user_id], "%#{@expressao}%")
    else
      @cursos = Curso.new
    end
  end

end
