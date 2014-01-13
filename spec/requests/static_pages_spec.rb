require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do

  	it "should have the content 'One Step'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('One Step')
  		
  	end

  	it "should have the base title" do
  		visit '/static_pages/home'
  		expect(page).to have_title('One Step')
  	end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Contact page" do

  	it "should have the content 'Contact us'" do
  		visit '/static_pages/contact'
  		expect(page).to have_content('Contact us')
  	end

  	it "should have the right title" do
  		visit '/static_pages/contact'
  		expect(page).to have_title('One Step | Contact')
  	end
  end

  describe "Price page" do

  	it "should have content 'Our prices'" do
  		visit '/static_pages/price'
  		expect(page).to have_content('Our prices')
  	end

  	it "should have the right title" do
  		visit '/static_pages/price'
  		expect(page).to have_title('One Step | Prices')
  	end
  end

  describe "Sale page" do

  	it "should have content 'Our sales!'" do
  		visit '/static_pages/sale'
  		expect(page).to have_content('Our sales!')
  	end

  	it "should have the right title" do
  		visit '/static_pages/sale'
  		expect(page).to have_title('One Step | Sales')
  	end
  end

  describe "Schedule page" do

  	it "should have content 'Schedule'" do
  		visit '/static_pages/schedule'
  		expect(page).to have_content ('Schedule')
  	end

  	it "should have the right title" do
  		visit '/static_pages/schedule'
  		expect(page).to have_title('One Step | Schedule')
  	end
  end
end
