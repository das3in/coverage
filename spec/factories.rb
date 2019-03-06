FactoryBot.define do
  factory :micropost do
    author { nil }
    content { "MyString" }
    tournament { nil }
  end

  factory :rating_change do
    team { nil }
    old_rating { 1 }
    new_rating { 1 }
    match { nil }
    tournament { nil }
  end

  factory :match do
    home_team { nil }
    away_team { nil }
    home_team_score { 1 }
    away_team_score { 1 }
    winner { nil }
    round { 1 }
    tournament { nil }
  end

  factory :registered_team do
    team { nil }
    tournament { nil }
  end

  factory :tournament do
    name { "MyString" }
    league { nil }
    start_date { "2019-03-05" }
    end_date { "2019-03-05" }
  end

  factory :league do
    name { "MyString" }
    slug { "MyString" }
  end

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
