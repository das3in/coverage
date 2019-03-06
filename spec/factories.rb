FactoryBot.define do
  factory :team do
    location { "MyString" }
    name { "MyString" }
  end

  factory :user do
    
  end

  factory :post do
    title { "MyString" }
    slug { "MyString" }
    description { "MyString" }
    body { "MyString" }
    draft { false }
  end

end
