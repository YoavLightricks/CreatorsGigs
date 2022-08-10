FactoryBot.define do
  factory :gig do
    brand_name { 'some crap' }
    creator_id { rand(1..10) }
  end
end
