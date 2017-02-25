class PlacesController < ApplicationController
  before_action :set_employer

  def new
    @offer = @employer.offers.build
  end


  private

  def set_project
    @employer = Employer.find(params[:project_id])
  end

end
