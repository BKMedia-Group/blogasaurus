require 'spec_helper'

module Blogasaurus
  describe Blog do
    before do
      @blog = Blog.new title: 'some title',
                       intro_text: 'some intro text',
                       full_text: 'some full text'
    end

    subject { @blog }

    it { should respond_to(:title) }
    it { should respond_to(:intro_text) }
    it { should respond_to(:full_text) }
    it { should respond_to(:published) }

    it { should be_valid }

    describe "When title is not present" do
      before { @blog.title = " " }
      it { should_not be_valid }
    end

    describe "When intro_text is not present" do
      before { @blog.intro_text = " " }
      it { should_not be_valid }
    end

    describe "When full_text is not present" do
      before { @blog.full_text = " " }
      it { should_not be_valid }
    end
  end
end
