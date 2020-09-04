FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    delv_fee_id { Faker::Number.between(from: 2, to: 3) }
    delv_from_id { Faker::Number.between(from: 2, to: 48) }
    delv_time_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    # item.images.attach_File('spec/fixtures/test_image.jpg', filename: 'test_image.jpg', content_type: 'image/jpg')
   end
  end