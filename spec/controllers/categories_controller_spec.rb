require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      category = Category.new(name: nil)
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of image' do
      category = Category.new(name: 'category', image: nil)
      expect(category).to_not be_valid
      expect(category.errors[:image]).to include("can't be blank")
    end
  end

  it 'belongs to user' do
    expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  describe 'associations' do
    it 'has and belongs to many purchases with dependent destroy' do
      association = Category.reflect_on_association(:purchases)
      expect(association.macro).to eq(:has_and_belongs_to_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end
end
