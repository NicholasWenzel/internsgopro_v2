class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :summary, :destroy]
  before_action :set_star_fields, only: [:new, :create]

  def index
    @ratings = Rating.all
  end

  def show; end

  def new
    @rating = Rating.new
    @rating_error = false
  end

  def create
    @rating = Rating.new(rating_params)
    @rating_error = false
    if @rating.save
      redirect_to summary_rating_path(@rating)
    else
      @rating_error = true
      render 'new'
    end
  end

  def summary
    # Hash to render names & corresponding values to view + partial
    @display_values_stars_left = {"Goals" =>  @rating.rating_goals, "Objectives" => @rating.rating_objectives, "Supervision" => @rating.rating_supervision}
    @display_values_stars_right = {"Learning" => @rating.rating_learning, "Renumeration" => @rating.rating_remuneration, "Atmosphere" => @rating.rating_atmosphere}
    # This line will grab all the values that are stored for the stars
    score_array = [ @rating.rating_goals, @rating.rating_objectives, @rating.rating_supervision, @rating.rating_learning, @rating.rating_remuneration, @rating.rating_atmosphere]
    # The inject method will sum them up + create an average
    score_float = score_array.inject(:+) / score_array.size.to_f
    @score = score_float.round(1)
    # Calls method which will adjust the text accordingly
    create_statement_summary
  end

  def edit;end

  def update
    if @rating.update(rating_params)
      redirect_to rating_path(@rating)
    else
      render 'edit'
    end
  end

  def destroy;end

  private

  def set_star_fields
    # rating_recommendation: "Would you recommend your internship?",
    @star_fields = {
      rating_goals: "Clarity of Learning Objectives",
      rating_objectives: "Learning objectives were respected",
      rating_supervision: "Supervision",
      rating_learning: "Learning Curve",
      rating_remuneration: "Renumeration covered living costs",
      rating_atmosphere: "Working atmosphere",
    }
  end

  def rating_params
    params.require(:rating).permit(
      :employer,
      :location,
      :rating_recommendation,
      :rating_goals,
      :rating_objectives,
      :rating_supervision,
      :rating_learning,
      :rating_remuneration,
      :rating_atmosphere,
      :job_position,
      :department,
      :internship_start_year,
      :internship_duration,
      :net_salary_per_month,
      :professional_status,
      :contract_signed,
      :job_offered,
      :additional_comments,
      :reviewer_name,
      :reviewer_email,
      :extra_benefits,
      :read_conditions
      )
  end

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def create_statement_summary
    # FIX ME: check the scores and appropriate statements
    if @score >= 4 && @score <= 5
      @glad_to_hear = "We are glad to hear you had a"
      @good_bad_statement = "Good Internship!"
    elsif @score >= 3 && @score < 4
      @glad_to_hear = "We are glad to hear you had a"
      @good_bad_statement = "Nice Internship!"
    elsif @score >= 1 && @score < 3
      @glad_to_hear = "We are sorry to hear you did not have a"
      @good_bad_statement = " Excellent Internship!"
    elsif @score >= 0 && @score < 1
      @glad_to_hear = "We are sorry to hear you had a"
      @good_bad_statement = "Bad Internship!"
    end
  end
end
