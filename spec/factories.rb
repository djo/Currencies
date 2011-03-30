Factory.sequence(:count) { |n| n }

Factory.define :country do |t|
  t.code { "US#{Factory.next(:count)}" }
  t.name { "United States #{Factory.next(:count)}" }
end

Factory.define :currency do |t|
  t.code { "USD#{Factory.next(:count)}" }
  t.name { "Dollar #{Factory.next(:count)}" }
end

Factory.define :appointment do |t|
  t.association :country
  t.association :currency
end

Factory.define :trip do |t|
  t.description 'Trip description'
  t.completed_at { Date.today }
end

Factory.define :country_trip do |t|
  t.association :country
  t.association :trip
end
