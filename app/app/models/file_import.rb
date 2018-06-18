class FileImport < ApplicationRecord
  has_many :sales

  validates :content, presence: true

  def income
    income = 0
    self.sales.each do |sale|
      income = income + sale.unit_price * sale.quantity
    end
    return income
  end
end
