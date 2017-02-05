class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :email, :index => true
      t.string :password
      t.string :nome_completo
      t.string :telefone
      t.string :celular
      t.string :password_digest
      t.integer :tipo_conta, :default => 0, :limit => 1

      t.timestamps
    end
  end
end
