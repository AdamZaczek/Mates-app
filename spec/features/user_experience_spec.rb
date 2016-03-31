require "rails_helper"
require "spec_helper"

describe "page behavior for not logged in visitors" do
  it "does not let strangers come inside" do
    visit "/"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end



describe "app behavior for logged users" do  
  before :each do    
    visit "/users/sign_up"
  
    fill_in "Email",                 :with => "adamzaczekul@gmail.com"
    fill_in "Password",              :with => "supersecretpassword"
    fill_in "Password confirmation", :with => "supersecretpassword"
  
    click_button "Sign up"
    
    @group = create(:group_with_users, :users_count => 1)
    
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
  
  it "creates group" do
    expect{ create(:group) }.to change{Group.count}.by(1)
  end
  
  
  it "assigns group to user" do
    expect(User.last.groups.count).to equal 1
  end
    
  it "allows group to have many users" do
    @group = create(:group_with_users)
      
    expect(@group.users.count).to equal 5
  end
    
  it "allows user to has many groups" do
    @user = create(:user_with_groups)
      
    expect(@user.groups.count).to equal 5
  end
    
  it "logouts" do
    click_link "Logout"
    
    expect(page).to have_content("You need to sign in or sign up before continuing.")    
  end

end