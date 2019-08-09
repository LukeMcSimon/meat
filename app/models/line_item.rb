class LineItem < ApplicationRecord
  belongs_to :itemizable, polymorphic: true
  belongs_to :product

  delegate :price, :title, :image, :sku, to: :product

  def subtotal
    price * quantity
  end
end
