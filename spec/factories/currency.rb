FactoryBot.define do
  factory :input_currency, class: 'Currency' do
    name { Faker::Currency.name }
    iso_code { Faker::Currency.code }
  end

  factory :output_currency, class: 'Currency' do
    name { Faker::Currency.name }
    iso_code { Faker::Currency.code }
  end
end
