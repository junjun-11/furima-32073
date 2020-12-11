class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: :edit
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end

def move_to_index
  @item = Item.find(params[:id])
  unless user_signed_in? && current_user.id == @item.user.id
    redirect_to action: :index
  end
end