class Category < ApplicationRecord
    # other code in the model...
  
    has_one_attached :image
  end
  