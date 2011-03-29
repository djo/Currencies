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
