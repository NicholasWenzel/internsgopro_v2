class Rating < ActiveRecord::Base

# FIRST section of the form starts here
# --------------------------------------------------
validates :employer, presence: true

validates :location, presence: true

# RATINGS STAR VALUES

# 1. RECOMMENDATION
validates :rating_recommendation, inclusion: { in: [true, false],
    message: "Must be a yes or a no" }

# 2. GOALS
validates :rating_goals, inclusion: { in: (1..5),
    message: "value must be between 1 and 5" }

# 3. OBJECTIVES
validates :rating_objectives, inclusion: { in: (1..5),
    message: "value must be between 1 and 5" }

# 4. SUPERVISION
validates :rating_supervision, inclusion: { in: (1..5),
    message: "value must be between 1 and 5" }

# 5. LEARNING
validates :rating_learning, inclusion: { in: (1..5),
    message: "value must be between 1 and 5" }

# 6. REMUNERATION
validates :rating_remuneration, inclusion: { in: (1..5),
    message: "value must be between 1 and 5" }

# 7. ATMOSPHERE
validates :rating_atmosphere, inclusion: { in: (1..5),
    message: "value must be between 1 and 5" }

# SECOND section of the form starts here
# --------------------------------------------------

validates :job_position, presence: true

# validates :department, presence: true

validates :internship_start_year, presence: true, inclusion: { in: (2014..2017),
    message: "Must be between 2013 and 2017" }

validates :internship_duration, presence: true, inclusion: { in: ["Less than 3 months","3 months", "Less than 6 months", "6 months", "Less than a year", "To 1 year of more"],
    message: "Must be between 0 months to a year or more" }

validates :net_salary_per_month, presence: true

validates :professional_status, presence: true

validates :contract_signed, inclusion: { in: [true, false],
    message: "Must be yes or no" }

validates :job_offered, inclusion: { in: [true, false],
    message: "Must be yes or no" }

validates :reviewer_name, presence: true

validates :reviewer_email, presence: true

validates :read_conditions, presence: true


end
