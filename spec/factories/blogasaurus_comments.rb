# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogasaurus_comment, :class => 'Comment' do
    name "MyString"
    text "MyText"
    email "MyString"
    blog_id 1
  end
end
