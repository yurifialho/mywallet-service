json.extract! lancamento, :id, :nome, :descricao, :valor, :data, :categoria_id, :tipo_id, :created_at, :updated_at
json.url lancamento_url(lancamento, format: :json)
