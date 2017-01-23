class OffersController < ApplicationController
  before_action :set_employer, only: [:edit, :update, :destroy, :new, :create, :edit]
  before_action :set_offer, only: [:edit, :update, :destroy]

def new
  @offer = @employer.offers.build
end

def index
  if params[:employer_id]
    @offers = Employer.find(params[:employer_id]).offers
  else
    @offers = Offer.all
  end
end

def create
  @offer = @employer.offers.build(offer_params)

  if @offer.save
    flash[:notice] = "Offer has been created."
    redirect_to [@employer, @offer]
  else
      flash.now[:alert] = "Offer has not been created."
      render "new"
  end
end

def show
  @offer = Offer.find(params[:id])

end

  private

  def offer_params
    params.require(:offer).permit(:name, :employer, :city, :sector, :posted, :deadline, :salary, :label, :type, :job_description, :candidate_profile, :organisation_description, :offer, :apply)
  end

  def set_employer
    @employer = Employer.find(params[:employer_id])
  end

  def set_offer
    @offer = @employer.offers.find(params[:id])
  end


end
