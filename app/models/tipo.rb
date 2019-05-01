class Tipo < ApplicationRecord

  validates :descricao, presence: true
  
  has_many :lancamentos
end
