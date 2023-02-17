# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:content) { |n| "Conteúdo do post-#{n}" }
    user
  end
end
