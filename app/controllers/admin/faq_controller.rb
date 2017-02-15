class Admin::FaqController < ApplicationController
  layout 'painel_admin'
  before_action :admin_logged_in?

  def index
    flash[:notice] = nil
    @page = (params[:pg].to_i == 0 ? 1 : params[:pg].to_i)
    @limit_page = Site::PG

    @num_result = Faq.all.length
    @num_result = (Float(@num_result) / Float(@limit_page)).ceil

    @faq = Faq.all.limit(@limit_page).offset((@page == 1 ? 0 : ((@page.to_i * @limit_page.to_i) - @limit_page.to_i) ));
  end

  def delete
    Faq.find(params[:id]).destroy
    flash[:notice] = "Faq removido com sucesso!"
    redirect_to :action => "index"
  end

  def novo
    @faq = Faq.new
  end

  def create
    flash[:notice] = nil
    @faq = Faq.find_by(pergunta: params[:faq][:pergunta])

    unless @faq.nil?
      flash[:alert] = "Essa pergunta já existe!"
      render :novo
    else
      @faq = Faq.new
      @faq.pergunta = params[:faq][:pergunta]
      @faq.resposta = params[:faq][:resposta]

      if @faq.save
        flash[:notice] = "Faq criado com sucesso!"
        redirect_to :action => "index"
      else
        flash[:alert] = "Não foi possível criar esse faq!"
        render :novo
      end
    end
  end

  def edit
    @faq = Faq.find_by(id: params[:id])
  end

  def update
    @faq = Faq.find_by(id: params[:faq][:edit_id])
    @faq.pergunta = params[:faq][:pergunta]
    @faq.resposta = params[:faq][:resposta]

    if @faq.save
      flash[:notice] = "Dados salvos com sucesso!"
    else
      flash[:alert] = "Não foi possível salvar os dados do faq!"
    end

    redirect_to :action => "index"
  end
end
