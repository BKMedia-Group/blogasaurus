# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogasaurus_tag, :class => 'Tag' do
    title "MyString"
    slug "MyString"
  end
end
