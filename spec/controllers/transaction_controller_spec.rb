require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:category) { Category.create(name: 'Category') }

  describe 'POST #create' do
    context 'with invalid parameters' do
      let(:invalid_params) { { transaction_name: '', transaction_price: nil, category_id: category.id } }

      it 'does not create a new transaction' do
        expect do
          post :create, params: { category_id: category.id, transaction: invalid_params }
        end.not_to change(Transaction, :count)
      end

      it 'renders the new template' do
        post :create, params: { category_id: category.id, transaction: invalid_params }
        expect(response).to render_template('new')
      end
    end
  end
end
