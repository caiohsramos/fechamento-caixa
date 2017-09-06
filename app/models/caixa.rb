require 'csv'

class Caixa < ApplicationRecord

  validates :nome, :data, presence: true
  validates :cartao, :dinheiro, :troco_final, :troco_inicial, numericality: true
  has_many :despesas, dependent: :destroy
  accepts_nested_attributes_for :despesas

  def self.to_csv
    CSV.generate do |csv|
      csv << %w{ data dinheiro cartao }
      all.each do |caixa|
        csv << [I18n.l( caixa.data, format: :default), caixa.dinheiro, caixa.cartao ]
      end
    end
  end

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
