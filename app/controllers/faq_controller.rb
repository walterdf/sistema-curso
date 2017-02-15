class FaqController < ApplicationController
  layout 'painel'
  before_action :logged_in?

  def index
    flash[:notice] = nil
    flash[:alert] = nil
    @listFaq = Faq.all
  end
end
