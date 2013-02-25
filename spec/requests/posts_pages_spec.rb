require 'spec_helper'

describe "Post pages" do
	let!(:site) { FactoryGirl.create(:site) }
	subject { page }

	describe "index page" do
		let!(:post) { FactoryGirl.create(:post, site: site) }
		before { visit posts_path }

		it { should have_selector('h2', text: "Posts") }
		it { should have_content(post.title) }
	end

	describe "show page" do
		let!(:post) { FactoryGirl.create(:post, site: site) }
		before { visit post_path(post) }

		it { should have_content(post.title) }
	end

end