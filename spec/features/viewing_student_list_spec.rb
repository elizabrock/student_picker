feature "viewing student list" do
  scenario "students should be listed in the order they were last called on" do
    Fabricate(:student, name: "Angelica", last_called_at: 5.day.ago)
    Fabricate(:student, name: "Bob", last_called_at: 1.day.ago)
    Fabricate(:student, name: "Sally", last_called_at: nil)
    Fabricate(:student, name: "Joe", last_called_at: (Date.today.beginning_of_day + 9.hours))
    Fabricate(:student, name: "Terry", last_called_at: Time.now)
    visit root_path

    within("ul#student_list") do
      page.should have_css("li:nth-child(1)", text: "Sally")
      page.should have_css("li:nth-child(2)", text: "Angelica")
      page.should have_css("li:nth-child(3)", text: "Bob")
      page.should have_css("li:nth-child(4)", text: "Joe")
      page.should have_css("li:nth-child(5)", text: "Terry")
    end

    page.should have_content("Angelica (long, long ago)")
    page.should have_content("Bob (yesterday)")
    page.should have_content("Sally (never)")
    page.should have_content("Joe (9:00 AM)")
    page.should have_content("Terry (just now)")
  end
end
