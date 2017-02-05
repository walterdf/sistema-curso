class UserMailer < ApplicationMailer

  default from: "walterdf@gmail.com"

  def lembrar_senha
    @greeting = "Hi"

    mail to: "walterdf@gmail.com", subject: "Nova senha! - Editora Solução"
  end
end
