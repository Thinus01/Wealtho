class Category < ApplicationRecord
    has_many :transactions
    attribute :created_at, :datetime
    has_one_attached :image
    validates :name, presence: true
    validates :image, presence: true
    has_and_belongs_to_many :purchases, dependent: :destroy
  end
  