require 'spec_helper'

describe "Static Pages" do

  subject { page }

    shared_examples_for "all static pages" do
      it { should have_title(full_title(page_title)) }
    end

    it "should have the right links on the layout" do
      visit root_path
      click_link "Контакты"
      expect(page).to have_title(full_title('Контакты'))
      click_link "Расписание"
      expect(page).to have_title(full_title('Расписание'))
      click_link "Акции"
      expect(page).to have_title(full_title('Акции'))
      click_link "Цена"
      expect(page).to have_title(full_title('Цены'))
      click_link "Новости"
      expect(page).to have_title(full_title('Новости'))
      click_link "Медиагалерея"
      expect(page).to have_title(full_title('Медиагалерея'))
      click_link "Преподаватели"
      expect(page).to have_title(full_title('Преподаватели'))
      click_link "Направления"
      expect(page).to have_title(full_title('Направления'))
      click_link "one step"
      expect(page).to have_title(full_title(''))
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

        describe "follower/following counts" do
          let(:other_user) { FactoryGirl.create(:user) }
          before do
            other_user.follow!(user)
            visit root_path
          end

          it { should have_link("0 following", href: following_user_path(user)) }
          it { should have_link("1 followers", href: followers_user_path(user)) }
        end
      end  
    end
    
    describe "Contact page" do
      before { visit contact_path }

      let (:heading) { 'Контакты' }
      let (:page_title) { 'Контакты' }

      it_should_behave_like "all static pages"
    end

    describe "Price page" do
      before { visit price_path }

      let (:heading) { 'Наши цены' }
      let (:page_title) { 'Цены' }

       it_should_behave_like "all static pages"
    end

    describe "Sale page" do
      before { visit sale_path }

      let (:heading) { 'Акции' }
      let (:page_title) { 'Акции' }

      it_should_behave_like "all static pages"
    end

    describe "Schedule page" do
      before { visit schedule_path }

      let (:heading) { 'Расписание' }
      let (:page_title) { 'Расписание' }

      it_should_behave_like "all static pages"
    end 

  end