# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  rss        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Site do
  
	before { @site = Site.new(name: "Example blog", 
		url: "http://www.example.com", 
		rss: "http://www.example.com/feed" )}

	subject { @site }

	it { should respond_to(:name) }
	it { should respond_to(:url) }
	it { should respond_to(:rss) }

	it { should be_valid }

	describe "Site should have name" do
		before { @site.name = " " }

		it { should_not be_valid }
	end

	describe "Site should have url" do
		before { @site.url = " " }

		it { should_not be_valid }
	end

	describe "Site should have feed" do
		before { @site.rss = " " }

		it { should_not be_valid }
	end

	describe "Feed should be unique" do
		before do
			site2 = Site.new(name: "Example 2", 
				url: "http://www.example2.com",
				rss: "http://www.example.com/feed")
			site2.save
		end

		it { should_not be_valid }
	end

	describe "Site name should not be longer than 100 characters" do
		before { @site.name = "a" * 101 }

		it { should_not be_valid }
	end
end
