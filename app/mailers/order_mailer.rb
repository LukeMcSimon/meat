class OrderMailer < ApplicationMailer
  def confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: "Your Order #{order.id} at HumanMeat.com")
  end
end
