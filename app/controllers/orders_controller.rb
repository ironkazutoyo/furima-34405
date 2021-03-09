class OrdersController < ApplicationController
  def index
    @order_form_object = OrderFormObject.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order_form_object = OrderFormObject.new
  end

  def create
    @order_form_object = OrderFormObject.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_form_object.valid?
      @order_form_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form_object).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
