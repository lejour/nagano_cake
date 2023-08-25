class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment: { credit_card: 0, transfer: 1 }

  def subtotal
    item.add_tax_price * amount
  end

  def address_display
    '〒' + current_customer.postal_code + ' ' + current_customer.address + ' ' + current_customer.full_name
  end

end
