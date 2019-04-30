class Conta < ApplicationRecord
    validates :nome, presence: true
end
