class Conta < ApplicationRecord
    validates :nome, presence: true

    has_many :lancamentos
end
