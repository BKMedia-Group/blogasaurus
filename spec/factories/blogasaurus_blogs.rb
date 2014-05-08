# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogasaurus_blog, :class => 'Blogs' do
    title "MyString"
    intro_text "MyText"
    full_text "MyText"
    published false
  end
end
