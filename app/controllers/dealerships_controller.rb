class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def new
    @dealership = Dealership.new
  end

  def create
    @dealership = Dealership.new(dealership_params)

    if @dealership.save
      redirect_to @dealership
    else
      render :new
    end
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def update
    @dealership = Dealership.find(params[:id])

    if @dealership.update(dealership_params)
      redirect_to @dealership
    else
      render :edit
    end
  end

  def destroy
    @dealership = Dealership.find(params[:id])
    @dealership.destroy

    redirect_to root_path
  end

  private

  def dealership_params
    params.require(:dealership).permit(:name, :description)
  end
end
