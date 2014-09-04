feature "picking a student" do
  scenario "if there are no students" do
    visit root_path
    page.should_not have_button "Pick Student"
    page.should have_content("You must enter a student in order to begin using the app.")
  end
  scenario "if there are no eligible students" do
    Fabricate(:student, last_called_at: 5.minutes.ago)
    visit root_path
    page.should_not have_button "Pick Student"
    page.should have_content("There are no students that haven't been called today.")
  end
  scenario "if there is one eligible student" do
    Fabricate(:student, last_called_at: 5.minutes.ago)
    Fabricate(:student, name: "Bob",  last_called_at: nil)
    visit root_path
    click_button "Pick Student"
    page.should have_content("Bob has been picked")
    current_path.should == root_path
    page.should have_content("Bob (just now)")
  end
  scenario "if there are multiple eligible students" do
    Fabricate(:student, name: "Rose", last_called_at: 5.minutes.ago)
    Fabricate(:student, name: "Bob",  last_called_at: nil)
    Fabricate(:student, name: "Sally",  last_called_at: 2.days.ago)
    visit root_path
    click_button "Pick Student"
    eligible_item_picked = page.has_content?("Sally has been picked") || page.has_content?("Bob has been picked")
    eligible_item_picked.should be_truthy
  end
end
