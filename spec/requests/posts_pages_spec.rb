require 'spec_helper'

describe "Post pages" do
	let!(:site) { FactoryGirl.create(:site) }
	subject { page }

	describe "index page" do
		let!(:post) { FactoryGirl.create(:post, site: site) }
		before { visit posts_path }

		it { find('title').native.text.should == "AKBlogs | Posts" }
		it { should have_content(post.title) }
	end

end