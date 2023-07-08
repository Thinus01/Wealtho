require 'rails_helper'

RSpec.describe MainController, type: :controller do
  describe 'GET #home' do
    it 'assigns all categories ordered by id' do
      category1 = Category.create(name: 'Category 1')
      category2 = Category.create(name: 'Category 2')

      allow(Category).to receive_message_chain(:all, :order).and_return([category1, category2])

      get :home

      expect(assigns(:categories)).to eq([category1, category2])
    end

    it 'renders the home template' do
      get :home

      expect(response).to render_template('home')
    end
  end
end
