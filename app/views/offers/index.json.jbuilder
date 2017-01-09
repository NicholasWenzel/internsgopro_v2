json.array!(@offers) do |offer|
  json.extract! offer, :id, :name, :employer, :country, :city, :sector, :posted, :deadline, :salary, :label, :type, :job_description, :candidate_profile, :organisation_description, :offer, :apply
  json.url offer_url(offer, format: :json)
end
