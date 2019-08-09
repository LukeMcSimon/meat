class Product < ApplicationRecord
  validates :title, :sku, :price, presence: true
  validates :price, numericality: true

  has_many :line_items
  has_many :carts, through: :line_items, source: :itemizable, source_type: 'Cart'
  has_many :orders, through: :line_items, source: :itemizable, source_type: 'Order'

  has_one_attached :image

  extend FriendlyId
  friendly_id :title, use: :slugged

  def partner_link
    "https://www.thatnuttyguy.com/products/#{slug}"
  end
end
