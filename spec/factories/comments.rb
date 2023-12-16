# spec/factories/comments.rb
FactoryBot.define do
  factory :comment do
    content { "Sample content" }
    # Other attributes...
    association :user, factory: :user
    association :post, factory: :post
  end
end
