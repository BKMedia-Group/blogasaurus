# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogasaurus_author, :class => 'Author' do
    name "MyString"
    bio "MyText"
  end
end
