feature "viewing student list" do
  background do
    pending "implementation"
  end
  scenario "students should be listed in the order they were last called on" do
    Fabricate(:student, name: "Bob", last_called_at: 1.day.ago)
    Fabricate(:student, name: "Sally", last_called_at: nil)
    Fabricate(:student, name: "Joe", last_called_at: (Date.today.beginning_of_day + 9.hours))
    Fabricate(:student, name: "Terry", last_called_at: Time.now)
    visit root_path
    page.should have_list("Sally", "Bob", "Joe", "Terry")
    page.should have_content("Bob (yesterday)")
    page.should have_content("Sally (never)")
    page.should have_content("Joe (9:00 AM)")
    page.should have_content("Terry (just now)")
  end
end
