# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogasaurus_image, :class => 'Image' do
    file ""
    position 1
    alt "MyString"
    blog_id 1
  end
end
