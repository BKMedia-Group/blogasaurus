require 'spec_helper'

describe 'Blogs' do
  describe 'Index' do
    before { visit '/blog' }
    it "should have the content 'blogs'" do
      expect(page).to have_content('Blogs')
    end
    it "should have new blog button" do
      expect(page).to have_link('Add Blog')
    end
    it "should go to new blog page when clicked" do
      click_link 'Add Blog'
      expect(page).to have_content('New Blog')
    end
  end
  describe 'New' do
    before { visit '/blog/blogs/new' }

    it "should have the content 'new blog'" do
      expect(page).to have_content('New Blog')
    end

    it "should have a new blog form" do
      expect(page).to have_selector('form#new_blog')
    end
    it "should have blog form fields" do
      within('form#new_blog') do
        fill_in 'blog_title', with: 'test'
        fill_in 'blog_intro_text', with: 'test'
        fill_in 'blog_full_text', with: 'test'
        choose 'blog_published_true'
      end
    end
  end
end
