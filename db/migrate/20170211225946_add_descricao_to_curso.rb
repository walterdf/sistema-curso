class AddDescricaoToCurso < ActiveRecord::Migration[5.0]
  def change
    add_column :cursos, :descricao, :string
  end
end
