class Categoria < ApplicationRecord

  validates :descricao, presence: true

  has_many :lancamentos
end
