class Category < ApplicationRecord
    # other code in the model...
    attribute :created_at, :datetime
    has_one_attached :image
  end
  