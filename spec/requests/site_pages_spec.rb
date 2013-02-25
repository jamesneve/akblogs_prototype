require 'spec_helper'

describe "Site pages" do

	subject { page }

	describe "index page" do
		let!(:site) { FactoryGirl.create(:site) }
		before { visit sites_path }

		it { should have_selector('h2', text: "Sites") }
		it { should have_content(site.name) }
	end

	describe "new page" do
		before { visit new_site_path }

		it { should have_selector('h2', text: "Add Site") }

		describe "with invalid information" do
			it "should not create a site" do
				expect { click_button "Add Site!" }.not_to change(Site, :count)
			end

			describe "should display errors" do
				before { click_button "Add Site!" }

				it { should have_content("error") }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example blog"
				fill_in "URL", with: "www.example.com"
				fill_in "RSS feed", with: "www.example.com/feed"
			end

			it "should create a user" do
				expect { click_button "Add Site!" }.to change(Site, :count).by(1)
			end

			describe "should go to the next page" do
				before { click_button "Add Site!" }

				it { should have_content("Sites") }
			end
		end
	end
end