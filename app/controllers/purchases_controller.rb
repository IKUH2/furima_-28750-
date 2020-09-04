class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :correct_user, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase = AdressBuy.new
  end

  def create
    @purchase = AdressBuy.new(buy_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def correct_user
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def buy_params
    params.permit(:area_id, :token, :item_id, :prefecture, :city, :postal_code, :building, :adress, :phon_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: buy_params[:token],    
      currency:'jpy'                 
    )
  end
end