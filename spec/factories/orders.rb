FactoryBot.define do
  factory :order do
    date { "2021-06-04 16:35:15" }
    user { nil }
    opinion { 1 }
    status { 1 }
  end
end
