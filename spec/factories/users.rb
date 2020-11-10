FactoryBot.define do
  factory :user do
    # ユーザーが作成されるたびに違うuser_(番号)で作成される
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
