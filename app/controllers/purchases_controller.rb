class PurchasesController < ApplicationController
  def index
    @purchase_adress = PurchaseAdress.new
  end

  def create
    @purchase_adress = PurchaseAdress.new(adress_params)
    if @purchase_adress.valid?
        @purchase_adress.save
        redirect_to root_path
    else
      render :index
    end
  end

  private

  def adress_params
    params.require(:purchase_adress).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
