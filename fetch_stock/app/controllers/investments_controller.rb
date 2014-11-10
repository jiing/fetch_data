class InvestmentsController < ApplicationController

  before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]

  def index
    @investments = Investment.all
  end

  def show
    @investment = Investment.find(params[:id])
    @items = @investment.items
  end

  def new
    @investment = Investment.new
  end

  def create
    @investment = current_user.investments.build(investment_params)
    if @investment.save
      flash[:notice] = 'Investment was successfully created.'
      redirect_to investments_path
    else
      render :new
    end
  end

  def edit
   @investment = current_user.investments.find(params[:id])
  end

  def update
    @investment = current_user.investments.find(params[:id])

    if @investment.update(investment_params)
      redirect_to investment_path(@investment)
    else
      render :edit
    end
  end

  def destroy
    @investment = current_user.investments.find(params[:id])

    @investment.destroy

    redirect_to investments_path
  end

  
  private
  
  def investment_params
   params.require(:investment).permit(:title, :description)
  end

end

