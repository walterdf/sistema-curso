class UserMailer < ApplicationMailer

  default from: "Curso Solução <curso@editorasolucao.com.br>"

  def lembrar_senha(user)
    @usuario = user
    mail to: @usuario.email, subject: "Nova senha! - Editora Solução"
  end

  def contato(user,assunto,mensagem)
    @usuario = user
    @assunto = assunto
    @mensagem = mensagem

    mail from: @usuario.email, to: "Curso Solução <curso@editorasolucao.com.br>", subject: "Contato pelo site: #{assunto}"
  end
end
