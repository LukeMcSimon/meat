class ApplicationController < ActionController::Base
  private
    def load_cart
      return false unless customer_signed_in?
      current_customer.create_cart if current_customer.cart.nil?
      @cart = current_customer.cart
    end

    def load_cart_or_redirect_customer
      unless load_cart
        redirect_to new_customer_session_path, alert: "Please sign in to access your cart." and return
      end
    end
end
