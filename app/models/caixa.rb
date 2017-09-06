require 'csv'

class Caixa < ApplicationRecord
  validates :nome, :data, presence: true
  validates :cartao, :dinheiro, :troco_final, :troco_inicial, numericality: true
  has_many :despesas, dependent: :destroy
  accepts_nested_attributes_for :despesas

  def self.to_csv
    CSV.generate(col_sep: ';') do |csv|
      csv << %w{ data dinheiro cartao total }
      all.each do |caixa|
        csv << [I18n.l( caixa.data, format: :default),
          ApplicationController.helpers.number_with_precision(caixa.sum-caixa.cartao, precision: 2, separator: ',', delimiter: ''),
          ApplicationController.helpers.number_with_precision(caixa.cartao, precision: 2, separator: ',', delimiter: ''),
          ApplicationController.helpers.number_with_precision(caixa.sum, precision: 2, separator: ',', delimiter: '') ]
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
