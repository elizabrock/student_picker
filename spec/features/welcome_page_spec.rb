feature "Welcome Page", js: true do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Pick a student, any student!")
  end
end
