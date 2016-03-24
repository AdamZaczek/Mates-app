require "spec_helper"

describe "page behavior for logged users" do
  it "does not let strangers come inside" do
    visit "/"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end



describe "page behavior for logged users" do  
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
  
  it "shows create group page" do
    visit "/groups/new"

    expect(page).to have_content("Add a group!")
  end
end