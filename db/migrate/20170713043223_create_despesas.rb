class CreateDespesas < ActiveRecord::Migration[5.1]
  def change
    create_table :despesas do |t|
      t.text :nome
      t.decimal :valor

      t.timestamps
    end
  end
end
