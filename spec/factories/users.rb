FactoryBot.define do
  factory :user do
    family_name { "田中" }
    last_name { "太郎" }
    phone_number { "09012345678" }
    company_name { "株式会社ハナコ" }
    position_id { 2 }
    email { "test@com" }
    password { "123taro" }
    password_confirmation { password }
  end
end
