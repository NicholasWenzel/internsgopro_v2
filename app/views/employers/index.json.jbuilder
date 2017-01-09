json.array!(@employers) do |employer|
  json.extract! employer, :id, :name, :country, :city, :sector, :label, :logo, :photo, :video, :descr0_title, :descr0_full, :descr1_title, :descr1_full, :descr2_title, :descr2_full
  json.url employer_url(employer, format: :json)
end
