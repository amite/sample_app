require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "Home page" do

		before { visit root_path }

		it { should have_selector('title', :text => full_title('')) }
		it { should_not have_selector('title', :text => '| Home') }
		it { should have_selector('h1', :text => 'Sample App') }
	end

	describe "Help page" do

		before { visit help_path }

    it { should have_content('Help') }
    it { should have_selector('title', :text => full_title('Help')) }
  end

  describe "About page" do
  	before { visit about_path }

    it { should have_content('About Us') }
    it { should have_selector('title', :text => full_title('About Us')) }
		
  end

  describe "Contact Us" do
    before { visit contact_path }

    it { should have_content('Contact Us') }
    it { should have_selector('title', :text => full_title('Contact Us')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact Us')
    click_link "home"
    click_link "Sign up now"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')

  end

end