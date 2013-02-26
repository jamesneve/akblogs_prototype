# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  image        :string(255)
#  site_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published_on :datetime
#  entry_url    :string(255)
#  content      :text
#  author       :string(255)
#

require 'spec_helper'

describe Post do

	let!(:site) { FactoryGirl.create(:site) }

	before do
		@post = site.posts.build(title: "Example post", 
			image: "http://www.example.com/test.png",
			content: "This is some text. It's very nice text.")
	end

	subject { @post }

	it { should respond_to(:title) }
	it { should respond_to(:image) }
	it { should respond_to(:content) }
	it { should respond_to(:site) }
	its(:site) { should == site }

	it { should be_valid }

	describe "should have a title" do
		before { @post.title = " " }

		it { should_not be_valid }
	end

	describe "should have some content" do
		before { @post.content = " " }

		it { should_not be_valid }
	end

	describe "should have a site" do
		before { @post.site_id = nil }

		it { should_not be_valid }
	end

end
