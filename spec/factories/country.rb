FactoryBot.define do
  factory :country do
    name { Faker::Address.country }
    alpha3 { Faker::Address.country_code_long }
    alpha2 { Faker::Address.country_code }
    iso_number { Faker::Address.country_by_code }
  end
end
