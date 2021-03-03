class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :describe, :category_id, :status_id, :shipping_charge_id, :shipping_area_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
