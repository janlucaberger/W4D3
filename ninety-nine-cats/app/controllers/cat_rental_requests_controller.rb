class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    @rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @rental_request = CatRentalRequest.new(rental_params)
    if @rental_request.save
      redirect_to cats_url
    else
      render json: @rental_request.errors.full_messages, status: 422
    end
  end


  private

  def rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date)
  end

end
