class Transaction < ApplicationRecord
    belongs_to :category
    validates :transaction_name, presence: true
    validates :transaction_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end