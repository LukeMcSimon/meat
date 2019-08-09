class Order < ApplicationRecord
  include CheckoutSharedMethods

  belongs_to :customer
  has_many :line_items, as: :itemizable
  has_many :products, through: :line_items

  delegate :email, to: :customer
end
