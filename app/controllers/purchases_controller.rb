class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_purchase, only: [:index, :create]
  before_action :move_to_top_purchase, only: [:index, :create]
  before_action :move_to_top_item_purchased, only: [:index, :create]
  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to :root
    else
      render action: :index
    end
  end

  private

  def set_item_purchase
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.selling_price,
    card: purchase_params[:token],
    currency: 'jpy'
  )
end

def move_to_top_purchase
  redirect_to :root if current_user.id == @item.user.id
end

def move_to_top_item_purchased
  redirect_to :root if @item.purchase.present?
end
