json.extract! caixa, :id, :nome, :dinheiro, :troco_final, :troco_inicial, :cartao, :created_at, :updated_at, :data
json.url caixa_url(caixa, format: :json)
