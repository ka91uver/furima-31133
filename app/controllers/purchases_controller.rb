class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_collect, only: [:index, :create]
  # before_action :move_to_index, only: [:index]

  def index
    # @address = Address.new
    # @purchase = Purchase.new
    @item_purchase = ItemPurchase.new
    if @item.user.id == current_user.id || @item.purchase.present?
      redirect_to root_path
     else
       render "index"
    end
  end

  # def new
  #   @item_purchase = ItemPurchase.new
  # end

  def create
    # binding.pry
    @item_purchase = ItemPurchase.new(purchase_params)
    # order = Order.create(order_params)
    # Address.create(address_params)
    # Purchase.create(purchase_params)

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

  # def address_params
  #   params.permit(:post_code, :ship_from, :city, :house_number, :building_name, :phone_number, :purchase_id, :token)
  # end

  # def purchase_params
  #   params.permit(user_id: current_user.id, item_id: params[:item_id])
  # end

  def move_to_index
    #  unless @item.purchase.present?
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif Purchase.find_by(item_id: params[:item_id])
      redirect_to root_path
    end
  end

  def item_collect
    # binding.pry
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
