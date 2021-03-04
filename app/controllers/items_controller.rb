class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_signin_page, only: [:edit]
  before_action :move_to_root_path, only: [:edit]

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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :describe, :category_id, :status_id, :shipping_charge_id, :shipping_area_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
  def move_to_signin_page
    item = Item.find(params[:id])
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def move_to_root_path
    item = Item.find(params[:id])
    unless current_user == item.user
      redirect_to root_path
    end
  end
end
