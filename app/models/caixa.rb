class Caixa < ApplicationRecord
  validates :nome, presence: true
  validates :cartao, :dinheiro, :troco_final, :troco_inicial, numericality: true
  has_many :despesas, dependent: :destroy
  accepts_nested_attributes_for :despesas

  def sum
    s = self.despesas_sum
    self.dinheiro+self.troco_final-self.troco_inicial+self.cartao+s
  end

  def despesas_sum
    s = 0
    self.despesas.each do |d|
      s += d.valor
    end
    s
  end
end
