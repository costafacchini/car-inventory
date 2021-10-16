class Car < ApplicationRecord
  enum status: { new: 0, used: 1 }, _prefix: true

  validates :manufactured_at, presence: true
  validates :name, presence: true
  validates :status, presence: true

  def sale_price
    (table_price - depreciation).round(2)
  end

  private

  def depreciation
    return 0 if status_new?

    table_price * depreciation_tax_total
  end

  def depreciation_tax_total
    depreciation_tax_month_rate = 0.02
    (months_quantity * depreciation_tax_month_rate)
  end

  def months_quantity
    (Time.new.year * 12 + Time.new.month) - (manufactured_at.year * 12 + manufactured_at.month)
  end
end
