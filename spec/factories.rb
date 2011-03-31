Factory.sequence(:count) { |n| n }

Factory.define :country do |f|
  f.code { "US#{Factory.next(:count)}" }
  f.name { "United States #{Factory.next(:count)}" }
end

Factory.define :currency do |f|
  f.code { "USD#{Factory.next(:count)}" }
  f.name { "Dollar #{Factory.next(:count)}" }
end

Factory.define :appointment do |f|
  f.association :country
  f.association :currency
end

Factory.define :trip do |f|
  f.description 'Trip description'
  f.completed_at { Date.today }
end

Factory.define :country_trip do |f|
  f.association :country
  f.association :trip
end

Factory.define :user do |f|
  f.email { "user#{Factory.next(:count)}@mail.com" }
  f.password 'password'
  f.password_confirmation 'password'
end
