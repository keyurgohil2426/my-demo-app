class CitiesController < ApplicationController
  before_action :set_city, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!


  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_path, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to cities_path, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_path, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end

  def set_city
    @city = City.find(params[:id])
  end
end
