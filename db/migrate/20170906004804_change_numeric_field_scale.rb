class ChangeNumericFieldScale < ActiveRecord::Migration[5.1]
  def change
    change_column :caixas, :dinheiro, :decimal, :precision => 5, :scale => 2
    change_column :caixas, :troco_final, :decimal, :precision => 5, :scale => 2
    change_column :caixas, :troco_inicial, :decimal, :precision => 5, :scale => 2
    change_column :caixas, :cartao, :decimal, :precision => 5, :scale => 2
    change_column :despesas, :valor, :decimal, :precision => 5, :scale => 2
  end
end
