FactoryGirl.define do
  factory :user do
    transient do
      continent nil
      country nil
    end

    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "nipanipa.test+user#{n}@gmail.com" }
    password 'foobar'
    availability { %w(jan feb mar apr may jun jul aug sep oct nov dic) }

    region do
      if continent
        FactoryGirl.create(:region, continent: continent)
      elsif country
        FactoryGirl.create(:region, country: country)
      else
        FactoryGirl.create(:region)
      end
    end

    # simulate first login
    last_sign_in_at { Time.zone.now }
    current_sign_in_at { Time.zone.now }
    sign_in_count 1

    # simulate confirmation
    confirmed_at { Time.zone.now }

    trait :available_just_now do
      availability { [Time.zone.now.strftime('%b').downcase] }
    end

    trait :not_available do
      availability []
    end

    trait :with_language do
      after(:create) do |u|
        u.language_skills << create(:language_skill, user: u)
      end
    end

    factory :host, class: 'Host' do
      sequence(:name) { |n| "Host #{n}" }
      description 'We are a test host. We live in the countryside in the wild'
      skills 'I need strong healthy people for heavy work'
      accomodation 'Type of accomodation you will be providing your volunteers'
      hours_per_day 4
      days_per_week 5
      min_stay 1
    end

    factory :volunteer, class: 'Volunteer' do
      sequence(:name) { |n| "Volunteer #{n}" }
      description 'I am a test volunteer. I live in a big city full of noise'
      skills 'I am a fast learner and a laid back person'
    end
  end
end
