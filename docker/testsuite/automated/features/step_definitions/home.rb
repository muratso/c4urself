
Given(/^I am on the home page$/) do
  @home_page = HomePage.new
  @home_page.load

  expect(@home_page.current_url).to eq("https://www.thinkific.com/")
end

Then(/^I should see the company logo$/) do
  expect(@home_page.company_logo).to be_visible
end

Then(/^I should click on the get started button$/) do
  @home_page.click_get_started
end

Then(/^I should see the menu bar$/) do
  expect(@home_page.menu).to be_visible
end

Then(/^I should see the footer$/) do
  expect(@home_page.footer).to be_visible
end