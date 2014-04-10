require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin" do
  	before { visit signin_path }

  	describe "with invalid information" do
  		before { click_button "Sign in" }

	  	it { should have_title('Sign in') }
	  	it { should have_selector('div.alert.alert-error') }

	  	describe "after visiting another page" do
	  		before { click_link "Главная" }

	  		it { should_not have_selector('div.alert.alert-error') }
	  		
	  	end

	end

	
  end

  describe "authorization" do

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin, no_capybara: true }
    end

  	describe "for non-signed-in users" do
  		let(:user) { FactoryGirl.create(:user) }

  		describe "when attempting to visit a protected page" do
  			before do
  			end

  			describe "after signing in" do
  			
  			end
  		end

  		describe "in the Users controller" do
  		end
  	end

  	describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user, no_capybara: true }
    end
  end
end
