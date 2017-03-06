# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "admin@ticketee.com", password: "password", admin: true
    ) end

  unless User.exists?(email: "viewer@ticketee.com")
    User.create!(email: "viewer@ticketee.com", password: "password")
  end

  Rating.create(
   employer: "Shell",
   location: "Amsterdam",
   rating_recommendation: true,
   rating_goals: 3,
   rating_objectives: 3,
   rating_supervision: 4,
   rating_learning: 3,
   rating_remuneration: 4,
   rating_atmosphere: 5,
   job_position: "General manager",
   department: "Human Resources",
   internship_start_year: 2015,
   internship_duration: "Less than 3 months",
   net_salary_per_month: "Less than 200€",
   extra_benefit_meal_voucher: true,
   extra_benefit_transport_costs: false,
   extra_benefit_insurance: true, 
   extra_benefit_accomodation: false,
   professional_status: "Trainee",
   contract_signed: true,
   job_offered: false,
   additional_comments: "No",
   reviewer_name: "John",
   reviewer_email: "Smith",
   read_conditions: true
   )
  