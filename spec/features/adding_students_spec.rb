feature "adding students" do
  scenario "happy path" do
    visit root_path
    fill_in "Name", with: "Jim"
    click_button "Add Student"
    page.should have_content("Jim has been added to the list of students")
    within("ul#student_list") do
      page.should have_content("Jim (never)")
    end
  end

  scenario "duplicate student" do
    Fabricate(:student, name: "Jim")
    visit root_path
    fill_in "Name", with: "Jim"
    click_button "Add Student"
    page.should have_content("Student could not be created.")
    page.should have_error("has already been taken", on: "Name")
  end
end
