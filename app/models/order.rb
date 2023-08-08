class Order < ApplicationRecord
  enum payment: { credit_card: 0, transfer: 1 }
end
