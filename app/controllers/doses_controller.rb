class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :set_cocktail, only: [:new, :create]
  
  def index
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
     @dose = Dose.new(dose_params)
     @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
        redirect_to cocktail_path([@dose.cocktail])
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @dose.destroy
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
