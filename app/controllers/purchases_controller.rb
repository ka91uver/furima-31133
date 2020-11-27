class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_collect, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @item_purchase = ItemPurchase.new
    if @item.user_id == current_user.id || @item.purchase.present?
      redirect_to root_path
    else
      render 'index'
    end
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)

    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:post_code, :ship_from_id, :city, :house_number, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif Purchase.find_by(item_id: params[:item_id])
      redirect_to root_path
    end
  end

  def item_collect
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
