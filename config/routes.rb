Rails.application.routes.draw do

  get 'meus_cursos/index'

  get "/faq" => "faq#index"
  get "/dadosdeacesso" => "dadosdeacesso#index"
  get "/dadoscadastrais" => "dadoscadastrais#index"
  get "/meus_cursos" => "meus_cursos#index"

  get "/esqueci_senha" => "painel#esqueci_senha"

  get "/sair" => "painel#destroy"

  post "/request_email" => "painel#request_email"
  post "/login" => "painel#login"

  get "/dadoscadastrais" => "dadoscadastrais#index"
  post "/dadoscadastrais_update" => "dadoscadastrais#update"

  get "/dadosdeacesso" => "dadosdeacesso#index"
  post "/dadosdeacesso_update" => "dadosdeacesso#update"

  get "/suporte" => "suporte#index"
  post "/suporte_post" => "suporte#envia_mensagem"

  get "/meus_cursos/curso/:id" , to: "meus_cursos#curso"

  get "/busca/:nome", to: "busca#index"

  ######## ADMIN #########
  get "/admin" => "admin/admin#index"
  get "/admin/reset_conta" => "admin/admin#reset_conta"

  get "/admin/sair" => "admin/admin#destroy"
  post "/admin/login" => "admin/admin#login"

  get "/admin/acesso" => "admin/acesso#index", as: :admin_acesso
  get "/admin/acesso/delete/:id" => "admin/acesso#delete", as: :usuariocurso
  get "/admin/acesso/edit/:id" => "admin/acesso#edit", as: :admin_acesso_edit
  post "/admin/acesso/update" => "admin/acesso#update", as: :admin_acesso_update
  get "/admin/acesso/novo" => "admin/acesso#novo", as: :admin_acesso_novo
  post "/admin/acesso/novo" => "admin/acesso#create", as: :admin_acesso_create

  get "/admin/videos" => "admin/videos#index", as: :admin_videos
  get "/admin/videos/delete/:id" => "admin/videos#delete", as: :admin_videos_delete
  get "/admin/videos/edit/:id" => "admin/videos#edit", as: :admin_videos_edit
  post "/admin/videos/update" => "admin/videos#update", as: :admin_videos_update
  get "/admin/videos/novo" => "admin/videos#novo", as: :admin_videos_novo
  post "/admin/videos/novo" => "admin/videos#create", as: :admin_videos_create

  get "/admin/usuarios" => "admin/usuarios#index", as: :admin_usuarios
  get "/admin/usuarios/delete/:id" => "admin/usuarios#delete", as: :usuarios
  get "/admin/usuarios/edit/:id" => "admin/usuarios#edit", as: :admin_usuarios_edit
  post "/admin/usuarios/update" => "admin/usuarios#update", as: :admin_usuarios_update
  get "/admin/usuarios/reset_senha/:id" => "admin/usuarios#reset_senha", as: :admin_usuarios_reset_senha
  get "/admin/usuarios/novo" => "admin/usuarios#novo", as: :admin_usuarios_novo
  post "/admin/usuarios/novo" => "admin/usuarios#create", as: :admin_usuarios_create

  get "/admin/faq" => "admin/faq#index", as: :admin_faq
  get "/admin/faq/delete/:id" => "admin/faq#delete", as: :admin_faq_delete
  get "/admin/faq/edit/:id" => "admin/faq#edit", as: :admin_faq_edit
  post "/admin/faq/update" => "admin/faq#update", as: :admin_faq_update
  get "/admin/faq/novo" => "admin/faq#novo", as: :admin_faq_novo
  post "/admin/faq/novo" => "admin/faq#create", as: :admin_faq_create

  get "/admin/cursos" => "admin/cursos#index", as: :admin_cursos
  get "/admin/cursos/delete/:id" => "admin/cursos#delete", as: :admin_cursos_delete
  get "/admin/cursos/edit/:id" => "admin/cursos#edit", as: :admin_cursos_edit
  post "/admin/cursos/update" => "admin/cursos#update", as: :admin_cursos_update
  get "/admin/cursos/novo" => "admin/cursos#novo", as: :admin_cursos_novo
  post "/admin/cursos/novo" => "admin/cursos#create", as: :admin_cursos_create

  get "/admin/cursos" => "admin/cursos#index"
  get "/admin/faq" => "admin/faq#index"
  get "/admin/usuarios" => "admin/usuarios#index"

  root "painel#index"
end
