require 'spec_helper'

describe "Static Pages" do

  subject { page }

    shared_examples_for "all static pages" do
      it { should have_selector('h1', text: heading) }
      it { should have_title(full_title(page_title)) }
    end

    it "should have the right links on the layout" do
      visit root_path
      click_link "Contact"
      expect(page).to have_title(full_title('Contact'))
      click_link "Schedule"
      expect(page).to have_title(full_title('Schedule'))
      click_link "Sale"
      expect(page).to have_title(full_title('Sales'))
      click_link "Price"
      expect(page).to have_title(full_title('Prices'))
      click_link "one step"
      expect(page).to have_title(full_title(''))
      click_link "Sign up"
      expect(page).to have_title(full_title('Sign up'))
    end

    describe "Home page" do
      before { visit root_path}

      let (:heading) { 'One Step' }
      let (:page_title) { '' }

    	it_should_behave_like "all static pages"
      it { should_not have_title('| Home')}

      describe "for signed-in users"  do
        let(:user) { FactoryGirl.create(:user) }
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
          sign_in user
          visit root_path
        end

        it "should render the user's feed" do
          user.feed.each do |item|
            expect(page).to have_selector("li##{item.id}", text: item.content)
          end
        end
      end  
    end
    
    describe "Contact page" do
      before { visit contact_path }

      let (:heading) { 'Contact Us' }
      let (:page_title) { 'Contact' }

      it_should_behave_like "all static pages"
    end

    describe "Price page" do
      before { visit price_path }

      let (:heading) { 'Our prices' }
      let (:page_title) { 'Prices' }

       it_should_behave_like "all static pages"
    end

    describe "Sale page" do
      before { visit sale_path }

      let (:heading) { 'Our sales!' }
      let (:page_title) { 'Sales' }

      it_should_behave_like "all static pages"
    end

    describe "Schedule page" do
      before { visit schedule_path }

      let (:heading) { 'Schedule' }
      let (:page_title) { 'Schedule' }

      it_should_behave_like "all static pages"
    end 

  end