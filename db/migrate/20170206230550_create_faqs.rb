class CreateFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs do |t|
      t.string :pergunta
      t.string :resposta
      t.timestamps
    end
  end
end
