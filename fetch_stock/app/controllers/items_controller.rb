class ItemsController < ApplicationController

  before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]

  def new
    @investment = Investment.find(params[:investment_id])
    @item = @investment.items.build
  end

  def create
   @investment = Investment.find(params[:investment_id])
   @item = @investment.items.new(item_params)
   @item.owner = current_user

   if @item.save
    flash[:notice] = 'Item was successfully created.'
    redirect_to investment_path(@investment)
   else
    render :new
   end
  end

  def edit
   @investment = Investment.find(params[:investment_id])
   @item = current_user.items.find(params[:id])
  end

  def update
   @investment = Investment.find(params[:investment_id])
   @item = current_user.items.find(params[:id])

   if @item.update(item_params)
    redirect_to investment_path(@investment)
   else
    render :edit
   end
  end

  def destroy
    @investment = Investment.find(params[:investment_id])
    @item = current_user.items.find(params[:id])

    @item.destroy

    redirect_to investment_path(@investment)
  end


   private


   def item_params
     params.require(:item).permit(:symbol, :name, :stock_type, :value, :coin_type, :time)
   end

end
