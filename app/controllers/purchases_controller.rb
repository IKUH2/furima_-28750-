class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :correct_user, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:price, :token, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def correct_user
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id
  end

  def buy_params
    params.permit(:token, :item_id, :prefecture, :city, :post_code, :building_name,:phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
