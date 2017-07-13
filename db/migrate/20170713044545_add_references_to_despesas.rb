class AddReferencesToDespesas < ActiveRecord::Migration[5.1]
  def change
    add_reference :despesas, :caixa, foreign_key: true
  end
end
