User.create!(name: "Breez",
            email: "breez@costa.org",
            password: "foobar",
            password_confirmation: "foobar")
19.times do |n|
  name = Faker::Name.name
  email = "breez-#{n+1}@costa.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end
