require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path}

  	it { should have_content('One Step')}
    it { should have_title(full_title(''))}
    it { should_not have_title('| Home')}
  end

  describe "Contact page" do
    before { visit contact_path }

    it {should have_content('Contact us')}
    it { should have_title(full_title('Contact'))}
  end

  describe "Price page" do
    before { visit price_path }

     it {should have_content('Our prices')}
     it { should have_title(full_title('Prices'))}
  end

  describe "Sale page" do
    before { visit sale_path }

    it {should have_content('Our sales!')}
    it { should have_title(full_title('Sales'))}
  end

  describe "Schedule page" do
    before { visit schedule_path }

    it {should have_content('Schedule')}
    it { should have_title(full_title('Schedule'))}
  end
end
