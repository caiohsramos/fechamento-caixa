class CreateCaixas < ActiveRecord::Migration[5.1]
  def change
    create_table :caixas do |t|
      t.string :nome
      t.decimal :dinheiro
      t.decimal :troco_final
      t.decimal :troco_inicial
      t.decimal :cartao

      t.timestamps
    end
  end
end
