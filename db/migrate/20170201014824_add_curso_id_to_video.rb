class AddCursoIdToVideo < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :curso_id, :integer
    add_index :videos, :curso_id
  end
end
