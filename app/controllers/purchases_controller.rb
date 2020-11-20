class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :item_collect, only: [:index, :create]

  def index
    @purchase_adress = PurchaseAdress.new
  end

  def create
    @purchase_adress = PurchaseAdress.new(adress_params)
    if @purchase_adress.valid?
        pay_item
        @purchase_adress.save
        redirect_to root_path
    else
      render :index
    end
  end

  private

  def adress_params
    params.require(:purchase_adress).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.aki_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: adress_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    
  end

  def item_collect
    @item = Item.find(params[:id])
  end
  
end
