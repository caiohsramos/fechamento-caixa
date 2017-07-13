class Despesa < ApplicationRecord
  validates :nome, presence: true
  validates :valor, numericality: true
  belongs_to :caixa

end
