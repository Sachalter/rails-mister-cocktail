class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # c'est ici qu'on fait l'association entre dose et cocktail!!!
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def delete
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.destroy(dose_params)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
