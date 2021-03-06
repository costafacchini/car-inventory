class CarsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'secret', except: [:index, :show, :edit, :update]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to root_path
  end

  private

  def car_params
    params.require(:car).permit(:status, :name, :description, :manufactured_at, :table_price, :dealership_id)
  end
end
