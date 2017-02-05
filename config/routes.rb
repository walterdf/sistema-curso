Rails.application.routes.draw do

  get 'meus_cursos/index'

  get "/suporte" => "suporte#index"
  get "/faq" => "faq#index"
  get "/dadosdeacesso" => "dadosdeacesso#index"
  get "/dadoscadastrais" => "dadoscadastrais#index"
  get "/meus_cursos" => "meus_cursos#index"

  get "/esqueci_senha" => "painel#esqueci_senha"

  get "/sair" => "painel#destroy"
  post "/login" => "painel#login"

  root "painel#index"
end
