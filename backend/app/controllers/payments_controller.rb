class PaymentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_payment, only: [:show, :update, :destroy]

  def index
    @payments = Payment.all
    render json: @payments, status: :ok
  end

  def show
    render json: @payment, status: :ok
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      render json: @payment, status: :created
    else
      render json: { error: 'Unable to create payment', details: @payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      render json: @payment, status: :ok
    else
      render json: { error: 'Unable to update payment', details: @payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy
    render json: { message: 'Payment deleted successfully' }, status: :no_content
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
    render json: { error: 'Payment not found' }, status: :not_found if @payment.nil?
  end

  def payment_params
    params.require(:payment).permit(:payer_id, :receiver_id, :amount, :paid)
  end
end
