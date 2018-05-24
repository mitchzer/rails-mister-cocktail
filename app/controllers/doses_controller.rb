class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
