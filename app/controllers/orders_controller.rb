class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :new_order
  before_action :item_find
  before_action :move_to_root_path

  def index
    @order_form_object = OrderFormObject.new
    redirect_to root_path if OrderHistory.exists?(item_id: @item.id)
  end

  def create
    @order_form_object = OrderFormObject.new(order_params)
    if @order_form_object.valid?
      pay_item
      @order_form_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form_object).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel_num).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    redirect_to root_path if current_user == @item.user
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def new_order
    @order_form_object = OrderFormObject.new
  end
end
