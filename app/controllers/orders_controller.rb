class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show
  end

  def new
    @order = Order.new
    @order.food_item = FoodItem.find(params[:id])
  end

  def thanks

  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      format.html { redirect_to @order, notice: 'Order was successfully created.' }
      format.json { render :thanks, status: :created, location: @order }
    else
      format.html { render :show }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to menu_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :phone, :email, :address, :total).merge(:food_item_id => params[:food_item_id])
  end
end