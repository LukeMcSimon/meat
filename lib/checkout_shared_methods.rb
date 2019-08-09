module CheckoutSharedMethods
  def subtotal
    line_items.sum(&:subtotal)
  end

  def total
    subtotal
  end

  def bitcoin_total
    bitcoin_rate = HTTParty.get('https://bitpay.com/api/rates').find { |r| r['code'] == 'USD'}['rate']
    (total * (1.0 / bitcoin_rate)).round(8)
  end
end