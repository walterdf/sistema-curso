class CreateUsuariocursos < ActiveRecord::Migration[5.0]
  def change
    create_table :usuariocursos do |t|
      t.references :usuario, foreign_key: true
      t.references :curso, foreign_key: true
      t.datetime :data

      t.timestamps
    end
  end
end
