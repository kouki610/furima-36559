FactoryBot.define do
  factory :item do
    name                        { Faker::Name.initials(number: 5)}
    explanation                 { Faker::Lorem.sentence }
    category_id                 {2}
    status_id                   {2}
    lord_id                     {2}
    area_id                     {2}
    scheduled_delivery_id       {2}
    price                       {1000}
    association                 :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

  end
end