class BillsController < ApplicationController
  before_action :authenticate_user
  before_action :set_bill, only: [:update, :destroy]

  def create
    @bill = Bill.new(bill_params)
    @bill.payer = @current_user 

    if @bill.save
      render json: @bill, status: :created
    else
      render json: { error: 'Unable to create bill', details: @bill.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @bill.update(bill_params)
      render json: @bill, status: :ok
    else
      render json: { error: 'Unable to update bill', details: @bill.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy
    render json: { message: 'Bill deleted successfully' }, status: :no_content
  end

  def user_bills
    @bills = Bill.where(payer_id: @current_user.id)

    if @bills.any?
      render json: @bills, status: :ok
    else
      render json: { message: 'No bills found for this user' }, status: :not_found
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
    render json: { error: 'Bill not found' }, status: :not_found if @bill.nil?
  end

  def bill_params
    params.require(:bill).permit(:title, :amount, :currency, :group_id)
  end
end
