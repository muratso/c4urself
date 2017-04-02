Given(/^I am on the Get Started page$/) do
  @get_started_page = GetStarted.new
  expect(@get_started_page.current_url).to start_with("https://courses.thinkific.com/sites/new")
end

Then(/^I should fill the registration form$/) do
  #----FIRST STEP FORM--------
  sleep 3
  @get_started_page.fill_email
  @get_started_page.fill_password
  @get_started_page.fill_site_name
  @get_started_page.click_on_submit
  expect(page.current_url).to end_with("thinkific.com/sites/step_two")
  #----END FIRST STEP FORM--------

  #----SECOND STEP FORM--------
  sleep 3
  @get_started_page.choose_random_theme
  @get_started_page.click_on_submit
  expect(page.current_url).to end_with("thinkific.com/sites/step_three")
  #----END SECOND STEP FORM--------

  #----THIRD STEP FORM--------
  sleep 3
  @get_started_page.fill_first_name
  @get_started_page.fill_last_name
  @get_started_page.click_on_submit
  expect(page.current_url).to end_with("thinkific.com/sites/step_four")
  #----END THIRD STEP FORM--------

  #----FOURTH STEP FORM--------
  sleep 3
  @get_started_page.answer_first_question
  @get_started_page.answer_second_question
  @get_started_page.click_on_submit
  expect(page.current_url).to end_with("thinkific.com/manage")
  #----END FOURTH STEP FORM--------

end