class CartController < ApplicationController
  before_action :load_cart_or_redirect_customer

  def index
    @title = 'Your Cart'
  end

  def complete
    @order = Order.new(customer: current_customer)
    @order.line_items = @cart.line_items
    @order.save
    @cart.destroy
    OrderMailer.confirmation_email(@order).deliver
    redirect_to '/cart/complete' and return
  end

  def complete_page
    @order = current_customer.orders.last
    @title = "Your order is complete."
  end
end
