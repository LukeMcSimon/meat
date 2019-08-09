class AddItemizableToLineItems < ActiveRecord::Migration[6.0]
  def self.up
    add_reference :line_items, :itemizable, polymorphic: true, index: true
    LineItem.all.each do |li|
      li.itemizable_id = li.cart_id
      li.itemizable_type = 'Cart'
      li.save
    end
    remove_reference :line_items, :cart
  end

  def self.down
    add_reference :line_items, :cart, index: true
    LineItem.all.each do |li|
      li.cart_id = li.itemizable_id
      li.save!
    end
    remove_reference :line_items, :itemizable, polymorphic: true
  end
end
