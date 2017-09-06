class AddDataToCaixas < ActiveRecord::Migration[5.1]
  def change
    add_column :caixas, :data, :date
  end
end
