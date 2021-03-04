class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_signin_page, only: [:edit, :update]
  before_action :move_to_root_path, only: [:edit, :update]
  before_action :item_find, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
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
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root_path
    item = Item.find(params[:id])
    redirect_to root_path unless current_user == item.user
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
