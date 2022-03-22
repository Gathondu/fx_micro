# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


5.times do
  country = Country.create(
    name: Faker::Address.country,
    alpha3: Faker::Address.country_code_long,
    alpha2: Faker::Address.country_code,
    iso_number: Faker::Address.country_by_code,
  )

  currency = Currency.create(
    name: Faker::Currency.name,
    iso_code: Faker::Currency.code,
  )

  Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    country: country,
  )
end
