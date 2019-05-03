FactoryBot.define do
  factory :tournament_set do
    order { 1 }
    name { "MyString" }
  end

  factory :point_event do
    bunkerId { "MyString" }
    status { "MyString" }
    eventType { "MyString" }
    playerId { "MyString" }
    point { nil }
  end

  factory :bunker do
    name { "MyString" }
    top { 1 }
    left { 1 }
    rotation { 1 }
  end

  factory :field do
    tournament { nil }
  end

  factory :point do
    match { nil }
    start_time { "MyString" }
    end_time { "MyString" }
    winner_id { 1 }
  end

  factory :prediction do
    match { nil }
    home_team_guess { 1.5 }
    away_team_guess { 1.5 }
    winner_guess { nil }
    correct { false }
  end

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
