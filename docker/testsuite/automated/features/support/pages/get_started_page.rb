class GetStarted < SitePrism::Page
  #----FIRST STEP FORM--------
  element :email, "input[name='sites_step_one[email]']"
  element :password, "input[name='sites_step_one[password]']"
  element :site_name, "input[name='sites_step_one[site_name]']"

  #----SECOND STEP FORM--------
  # element :first_theme, "input[id='sites_step_two_theme_four']"
  # element :second_theme, "input[id='sites_step_two_theme_five']"
  # element :third_theme, "input[id='sites_step_two_theme_six']"
  elements :themes, "div[class='theme-border']"

  #----THIRD STEP FORM--------
  element :first_name, "input[name='sites_step_three[first_name]']"
  element :last_name, "input[name='sites_step_three[last_name]']"

  #----FOURTH STEP FORM--------
  element :first_question, "#sites_step_four_signup_teaching_stage"
  elements :first_question_options, "#sites_step_four_signup_teaching_stage option"
  element :second_question, "#sites_step_four_signup_teaching_goal"
  elements :second_question_options, "#sites_step_four_signup_teaching_goal option"

  # elements :first_question, "#sites_step_four_signup_teaching_stage option"
  # elements :second_question, "#sites_step_four_signup_teaching_goal option"

  element :submit, "input[type='submit']"
  def fill_email
    if (self.email.value == "")
      random_email = (5...10).map { ('a'..'z').to_a[rand(26)] }.join+"@gmail.com"
      self.email.set random_email
    end

  end

  def fill_password
    random_password = (6...15).map { ('a'..'z').to_a[rand(26)] }.join
    self.password.set random_password
  end

  def fill_site_name
    self.site_name.set "Testing"+rand(0..10000).to_s
  end

  def choose_random_theme
    i = self.themes.count - 1
    index=rand(0..i)
      if($BROWSER=="phantomjs")
        self.themes[index].trigger('click')
      else
        self.themes[index].click
      end


  end

  def fill_first_name
    random_first_name = (5...10).map { ('a'..'z').to_a[rand(26)] }.join
    self.first_name.set random_first_name
  end

  def fill_last_name
    random_last_name = (5...10).map { ('a'..'z').to_a[rand(26)] }.join
    self.last_name.set random_last_name
  end

  def answer_first_question
    i = self.first_question_options.count - 1
    index=rand(1..i)
    self.first_question.select(first_question_options[index].text)

  end

  def answer_second_question
    i = self.second_question_options.count - 1
    index=rand(1..i)
    self.second_question.select(second_question_options[index].text)
  end

  def click_on_submit
    self.submit.click
  end
end
