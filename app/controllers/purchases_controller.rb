class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_collect, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @purchase_adress = PurchaseAdress.new
  end

  def create
    binding.pry
    @purchase_adress = PurchaseAdress.new(purchase_adress_params)
    if @purchase_adress.valid?
        pay_purchase_adress
        @purchase_adress.save
        redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def purchase_adress_params
    params.require(:purchase_adress).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    #  unless @item.purchase.present?
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
    Payjp.aki_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_adress_params[:token],
      currency: 'jpy'
    )
  end
end
