class Lancamento < ApplicationRecord
  belongs_to :categoria
  belongs_to :tipo
  belongs_to :conta
end
