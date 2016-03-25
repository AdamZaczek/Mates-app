require "rails_helper"
require "spec_helper"

describe "page behavior for not logged in visitors" do
  it "does not let strangers come inside" do
    visit "/"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end



describe "simple page behavior for logged users" do  
  before :each do    
    visit "/users/sign_up"
  
    fill_in "Email",                 :with => "adamzaczekul@gmail.com"
    fill_in "Password",              :with => "supersecretpassword"
    fill_in "Password confirmation", :with => "supersecretpassword"
  
    click_button "Sign up"
    
  end
  it "allows logged users to visit index page" do
    visit "/"

    expect(page).to have_content("Your groups")
  end
  
    it "shows create group page" do
    visit "/groups/new"

    expect(page).to have_content("Add a group!")
  end
  
  it "allows to create a new group" do
    visit "/groups/new"
    
    fill_in "Group name",                 :with => "skate contest"
    
    click_button "Create Group"

    expect(page).to have_content("Add new members to: skate contest")
  end
  
  it "logouts" do
    click_link "Logout"
    
    expect(page).to have_content("You need to sign in or sign up before continuing.")    
  end
end
  
  
describe "user and group interactions" do  
  before :each do   
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  
  it "to be filled" do
    visit "/"
    
    expect(page).to have_content("Your groups")
  end
end