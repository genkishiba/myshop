class ShopsController < ApplicationController
  before_action :find_id_params, only:[:show, :edit, :update, :destroy]
  
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(new_params)
    if @shop.save
      redirect_to shops_path, notice: "shop新增成功"
    else
      render :new, alert: "shop新增失敗"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(new_params)
      redirect_to shops_path, notice: "shop修改成功"
    else
      render :edit, alert: "shop修改失敗"
    end
  end

  def destroy
    @shop.delete
    redirect_to shops_path, notice: "shop刪除成功"
  end
  
  private
  def new_params
    params.require(:shop).permit(:name, :address, :tel, :introduce)
  end

  def find_id_params
    @shop = Shop.find_by!(id: params[:id])
  end
end