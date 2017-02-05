class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :name
      t.string :url_thumb
      t.timestamps
    end
  end
end
