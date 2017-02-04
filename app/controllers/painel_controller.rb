class PainelController < ApplicationController
  def index
    render layout: 'application'
  end

  layout 'painel'
  def logado

  end
end
