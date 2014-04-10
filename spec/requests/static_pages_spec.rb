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
      #click_link "Медиагалерея"
      #expect(page).to have_title(full_title('Медиагалерея'))
      #click_link "Преподаватели"
      #expect(page).to have_title(full_title('Преподаватели'))
      #click_link "Направления"
      #expect(page).to have_title(full_title('Направления'))
      click_link "one step"
      expect(page).to have_title(full_title(''))
    end

    describe "Home page" do
      before { visit root_path}

      let (:heading) { 'One Step' }
      let (:page_title) { '' }

    	it_should_behave_like "all static pages"
      it { should_not have_title('| Home')}
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