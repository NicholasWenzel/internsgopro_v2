class Admin::EmployersController < Admin::ApplicationController
  def new
    @employer = Employer.new
  end
  def create
    @employer = employer.new(employer_params)
    if @employer.save
      flash[:notice] = "Employer has been created."
      redirect_to @employer
    else
      flash.now[:alert] = "Employer has not been created."
           render "new"
    end
end
  def destroy
    @employer = Employer.find(params[:id])

    @employer.destroy
    flash[:notice] = "Employer has been deleted."
    redirect_to employers_path
  end
private
  def employer_params
    params.require(:employer).permit(:name, :description)
end end
