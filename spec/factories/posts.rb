# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    title { "Sample Title" }
    # Other attributes...
    association :author, factory: :user
  end
end
