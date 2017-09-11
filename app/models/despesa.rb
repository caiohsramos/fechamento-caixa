class Despesa < ApplicationRecord
  validates :nome, presence: true
  validates :valor, numericality: true
  belongs_to :caixa

  def self.to_csv
    CSV.generate(col_sep: ';') do |csv|
      csv << %w{ data nome valor }
      all.each do |desp|
        csv << [I18n.l( desp.caixa.data, format: :default),
          desp.nome,
          ApplicationController.helpers.number_with_precision(desp.valor, precision: 2, separator: ',', delimiter: '') ]
      end
    end
  end

  def self.month_sum
    s = 0
    Despesa.all.each do |d|
      s += d.valor
    end
    s
  end

end
