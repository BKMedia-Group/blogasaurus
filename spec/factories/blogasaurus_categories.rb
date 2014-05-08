# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogasaurus_category, :class => 'Category' do
    title "MyString"
    slug "MyString"
    description "MyText"
    photo ""
  end
end
