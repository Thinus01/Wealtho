class Category < ApplicationRecord
    has_many :transactions
    attribute :created_at, :datetime
    has_one_attached :image
  end
  