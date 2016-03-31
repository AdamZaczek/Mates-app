require "rails_helper"
require "spec_helper"

describe "relations" do
  
  before :each do    
    visit "/users/sign_up"
  
    fill_in "Email",                 :with => "adamzaczekul@gmail.com"
    fill_in "Password",              :with => "supersecretpassword"
    fill_in "Password confirmation", :with => "supersecretpassword"
  
    click_button "Sign up"
    @group = create(:group_with_users, :users_count => 1)
  
  # show 
    it "should get view" do
      assert_equal(user.groups.count, 1)
    end
    
    
    it "should create group" do
      @group = create(:group)
      visit @group
      expect(page).to have_content 'members'
    end
    
      it "logouts" do
    click_link "Logout"
    
    expect(page).to have_content("You need to sign in or sign up before continuing.")    
  end
  end
end