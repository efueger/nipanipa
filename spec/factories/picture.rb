# frozen_string_literal: true

FactoryGirl.define do
  factory :picture do
    name "My funny picture"
    image do
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec", "fixtures", "test_img.png")
      )
    end
    association :user, factory: :host
  end
end
