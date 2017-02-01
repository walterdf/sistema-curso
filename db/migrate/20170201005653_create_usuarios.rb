class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :login
      t.string :password
      t.integer :tipo_conta, :default => 0, :limit => 1

      t.timestamps
    end
  end
end
