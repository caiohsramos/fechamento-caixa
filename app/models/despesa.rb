class Despesa < ApplicationRecord
  validates :nome, :valor, presence: true
  belongs_to :caixa

end
