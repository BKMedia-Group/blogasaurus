require 'spec_helper'

module Blogasaurus
  describe Author do
    before do
      @author = Author.new name: 'some name',
                           bio: 'some bio'
    end

    subject { @author }

    it { should respond_to(:name) }
    it { should respond_to(:bio) }

    it { should be_valid }

    describe "when name is not present" do
      before { @author.name = " " }
      it { should_not be_valid }
    end

    describe "when bio is not present" do
      before { @author.bio = " " }
      it { should_not be_valid }
    end
  end
end
