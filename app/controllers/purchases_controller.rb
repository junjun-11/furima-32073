class PurchasesController < ApplicationController
  before_action :set_item_purchase, only: [:index, :create]
  def index
    @user_purchase = UserPurchase.new
    # @item = Item.find(params[:item_id])
  end

  def create
    # @item = Item.find(params[:item_id])
    # binding.pry
    @user_purchase = UserPurchase.new(purchase_params)
    # binding.pry
     if @user_purchase.valid?
      # binding.pry
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
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
