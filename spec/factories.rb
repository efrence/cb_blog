FactoryGirl.define do
  factory :user do
    name "John"
    email  "john@doe.com"
    password 'secret'
  end

  factory :post do
    title "awesome"
    content "bla bla"
  end
end
