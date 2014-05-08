# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogasaurus_tag_ref, :class => 'TagRef' do
    blog_id 1
    blog_tag_id 1
  end
end
