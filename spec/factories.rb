FactoryBot.define do
  sequence(:title) { |n| "Title ##{n}" }
  sequence(:description) { |n| "Description for post ##{n}" }
  sequence(:slug) { |n| "title-#{n}-slug" }
  sequence(:first_name) { |n| "#{n}ohn" }
  sequence(:last_name) { |n| "#{n}mith" }
  sequence(:name) { |n| "#{n}ame" }

  factory :pickem do
    name
    start_date { "2019-03-23" }
    end_date { "2019-03-23" }
    tournament { nil }
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
    name
    league { nil }
    start_date { "2019-03-05" }
    end_date { "2019-03-05" }
  end

  factory :league do
    name
    slug { "MyString" }
  end

  factory :team do
    location { "MyString" }
    name
    trait :with_avatar do
      avatar {
        fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.png'), 'image/png') 
      }
    end
  end

  factory :user do
    first_name
    last_name
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
    authentication_token { "random_string" }
  end

  factory :post do
    title
    slug
    description
    body { "MyString" }
    draft { false }

    trait :with_thumbnail do
      thumbnail { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.png'), 'image/png') }
    end
  end
end
