class TransactionsController < ApplicationController

    def index
      @category = Category.find(params[:category_id])
      @transactions = @category.transactions
      @total_price = @transactions.sum(:transaction_price)
    end
  
    def new
      @category = Category.find(params[:category_id])
      @transaction = Transaction.new
    end
  
    def create
      @transaction = Transaction.new(transaction_params)
      if @transaction.save
        redirect_to transaction_category_path(@transaction.category_id), notice: 'Transaction created successfully.'
      else
        render :new
      end
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:transaction_name, :transaction_price, :category_id)
    end
  end
  